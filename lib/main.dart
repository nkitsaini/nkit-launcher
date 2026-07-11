import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_icon.dart';
import 'app_list.dart';
import 'icon_picker/catalog.dart';
import 'icon_picker/picker.dart';
import 'launcher_bridge.dart';

const _lightSurface = Color(0xFFFFFCF5);
final _defaultLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppListCacher()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppListCacher>(
      builder: (context, appList, child) {
        return MaterialApp(
          title: 'Nkit Launcher',
          themeMode: appList.settings.themeMode,
          theme: _defaultLightTheme.copyWith(
            colorScheme: _defaultLightTheme.colorScheme.copyWith(
              surface: _lightSurface,
            ),
            scaffoldBackgroundColor: _lightSurface,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textController = TextEditingController();
  String? filterSearch;

  @override
  void initState() {
    super.initState();
    LauncherBridge.setHomePressedHandler(_returnToGrid);
  }

  @override
  void dispose() {
    LauncherBridge.setHomePressedHandler(null);
    textController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    textController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      filterSearch = null;
    });
  }

  /// Android routes every Home press to this activity, including when one of
  /// its modal routes is visible. Treat that action as a reset, rather than a
  /// normal back action: dismiss every overlay and leave only the home grid.
  Future<void> _returnToGrid() async {
    if (!mounted) {
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
    Navigator.of(context, rootNavigator: true)
        .popUntil((route) => route.isFirst);
    if (filterSearch != null) {
      _clearSearch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Consumer<AppListCacher>(
      builder: (context, appList, child) {
        final wallpaper = appList.settings.wallpaperFor(brightness);
        final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
        final navigationInset = MediaQuery.viewPaddingOf(context).bottom;
        // The foreground already reserves navigationInset through SafeArea.
        // Move it only by the keyboard height that remains above that space.
        final keyboardOffset = (keyboardInset - navigationInset)
            .clamp(0.0, double.infinity)
            .toDouble();
        final children = <Widget>[];
        if (filterSearch == null) {
          children.add(const Expanded(child: IconAppGridWidget()));
        } else {
          children.add(
            Expanded(
              child: wallpaper == null
                  ? AppListWidget(
                      filterKey: filterSearch ?? '',
                      onAppOpen: _clearSearch,
                    )
                  : _FrostedSurface(
                      settings: appList.settings,
                      child: AppListWidget(
                        filterKey: filterSearch ?? '',
                        onAppOpen: _clearSearch,
                      ),
                    ),
            ),
          );
        }
        final searchRow = Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8.0),
                  hintText: 'Search ${appList.searchableEntries().length} apps',
                ),
                onChanged: (value) => setState(() => filterSearch = value),
                onTap: () => setState(() => filterSearch = ''),
                autocorrect: false,
                autofocus: false,
              ),
            ),
            IconButton(
              icon: Icon(
                filterSearch == null ? Icons.more_vert : Icons.close,
              ),
              tooltip: filterSearch == null ? 'Options' : 'Close search',
              onPressed: filterSearch == null
                  ? () => _showGlobalActions(context)
                  : _clearSearch,
            ),
          ],
        );
        children.add(
          Padding(
            padding: EdgeInsets.only(bottom: keyboardOffset),
            child: wallpaper == null
                ? searchRow
                : _FrostedSurface(
                    settings: appList.settings,
                    child: searchRow,
                  ),
          ),
        );

        return PopScope(
          canPop: filterSearch == null,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop && filterSearch != null) {
              _clearSearch();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              fit: StackFit.expand,
              children: [
                // This background layer intentionally stays outside the
                // keyboard-responsive safe area, so opening the keyboard
                // cannot change the wallpaper's crop or position.
                ColoredBox(color: Theme.of(context).colorScheme.surface),
                if (wallpaper != null)
                  RepaintBoundary(child: _WallpaperImage(wallpaper: wallpaper)),
                if (wallpaper != null)
                  ColoredBox(
                    color: Theme.of(context).colorScheme.surface.withValues(
                        alpha: brightness == Brightness.dark ? 0.32 : 0.18),
                  ),
                BackdropGroup(
                  child: SafeArea(
                    // Keep foreground controls clear of the navigation bar
                    // even while the keyboard changes MediaQuery.padding.
                    maintainBottomViewPadding: true,
                    child: Column(children: children),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class IconAppGridWidget extends StatelessWidget {
  const IconAppGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppListCacher>(
      builder: (context, appList, child) {
        if (appList.data == null) {
          return const Row(children: []);
        }

        final grid = appList.data!.grid;
        const iconSize = 48.0;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: appList.settings.homeColumns,
          ),
          itemCount: grid.length,
          itemBuilder: (context, index) {
            final item = grid[index];
            final entry = appList.entryFor(item);
            if (entry == null) {
              return const SizedBox.shrink();
            }
            final icon = _gridIcon(item, entry, size: iconSize);
            return GestureDetector(
              onLongPress: () => _showGridItemActions(context, index),
              // Keep a comfortably large touch target, but constrain the
              // visible frost to the icon and its configured breathing room.
              child: IconButton(
                icon: _FrostedHomeIcon(
                  settings: appList.settings,
                  child: icon,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                onPressed: () => _openEntry(context, entry),
              ),
            );
          },
        );
      },
    );
  }
}

class _FrostedHomeIcon extends StatelessWidget {
  const _FrostedHomeIcon({required this.settings, required this.child});

  final LauncherSettings settings;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!settings.frostedIconBackgrounds) {
      return child;
    }
    return Align(
      widthFactor: 1,
      heightFactor: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(settings.iconBackgroundRadius),
        child: BackdropFilter.grouped(
          filter: ImageFilter.blur(
            sigmaX: settings.frostBlur,
            sigmaY: settings.frostBlur,
          ),
          child: ColoredBox(
            color: Theme.of(context)
                .colorScheme
                .surface
                .withValues(alpha: settings.frostOpacity),
            child: Padding(
              padding: EdgeInsets.all(settings.iconBackgroundPadding),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

/// All wallpaper overlays use the same visual controls.  Sharing the group
/// also lets the engine reuse one backdrop read while the home grid scrolls.
class _FrostedSurface extends StatelessWidget {
  const _FrostedSurface({required this.settings, required this.child});

  final LauncherSettings settings;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter.grouped(
        filter: ImageFilter.blur(
          sigmaX: settings.frostBlur,
          sigmaY: settings.frostBlur,
        ),
        child: ColoredBox(
          color: Theme.of(context)
              .colorScheme
              .surface
              .withValues(alpha: settings.frostOpacity),
          child: child,
        ),
      ),
    );
  }
}

/// Renders the crop and optional frost effect that the user chose for a
/// wallpaper. The effect is applied to the wallpaper image itself, separately
/// from the frosted search and icon surfaces drawn above it.
class _WallpaperImage extends StatelessWidget {
  const _WallpaperImage({required this.wallpaper});

  final WallpaperAppearance wallpaper;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = wallpaper.cropScale;
        final offset = Offset(
          -wallpaper.cropX * constraints.maxWidth * (scale - 1) / 2,
          -wallpaper.cropY * constraints.maxHeight * (scale - 1) / 2,
        );
        Widget image = Transform.translate(
          offset: offset,
          child: Transform.scale(
            scale: scale,
            child: SizedBox.expand(
              child: Image.file(
                File(wallpaper.path),
                fit: BoxFit.cover,
                alignment: Alignment(wallpaper.cropX, wallpaper.cropY),
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),
        );
        if (wallpaper.frosted && wallpaper.frostBlur > 0) {
          image = ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: wallpaper.frostBlur,
              sigmaY: wallpaper.frostBlur,
            ),
            child: image,
          );
        }
        return ClipRect(
          child: Stack(
            fit: StackFit.expand,
            children: [
              image,
              if (wallpaper.frosted && wallpaper.frostOpacity > 0)
                ColoredBox(
                  color: Color.lerp(
                    Colors.black,
                    Colors.white,
                    wallpaper.frostTint,
                  )!
                      .withValues(alpha: wallpaper.frostOpacity),
                ),
            ],
          ),
        );
      },
    );
  }
}

Widget _gridIcon(GridApp item, LauncherEntry entry, {double size = 24}) {
  if (item.icon != null || item.iconSlug != null) {
    return Icon(_iconForGridItem(item, entry), size: size);
  }
  return _EntryIcon(entry: entry, size: size, fallback: Icons.bolt);
}

class _EntryIcon extends StatefulWidget {
  const _EntryIcon({
    required this.entry,
    required this.size,
    required this.fallback,
  });

  final LauncherEntry entry;
  final double size;
  final IconData fallback;

  @override
  State<_EntryIcon> createState() => _EntryIconState();
}

class _EntryIconState extends State<_EntryIcon> {
  static final Map<String, Future<Uint8List?>> _cachedIcons = {};
  late Future<Uint8List?> _icon;

  @override
  void initState() {
    super.initState();
    _icon = _cachedIcons.putIfAbsent(widget.entry.id, () async {
      try {
        return await LauncherBridge.getEntryIcon(widget.entry.toJson());
      } catch (_) {
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _icon,
      builder: (context, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) {
          return Icon(widget.fallback, size: widget.size);
        }
        return Image.memory(
          bytes,
          width: widget.size,
          height: widget.size,
          filterQuality: FilterQuality.medium,
        );
      },
    );
  }
}

class _FuzzyHighlightedText extends StatelessWidget {
  const _FuzzyHighlightedText({
    required this.text,
    required this.matchedIndexes,
    this.style,
  });

  final String text;
  final Set<int> matchedIndexes;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final highlightedStyle = style?.copyWith(fontWeight: FontWeight.w500) ??
        const TextStyle(fontWeight: FontWeight.w500);
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          for (var index = 0; index < text.length; index++)
            TextSpan(
              text: text[index],
              style: matchedIndexes.contains(index) ? highlightedStyle : null,
            ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class AppListWidget extends StatelessWidget {
  const AppListWidget({
    super.key,
    required this.filterKey,
    required this.onAppOpen,
  });

  final String filterKey;
  final VoidCallback onAppOpen;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppListCacher>(
      builder: (context, appList, child) {
        if (appList.data == null) {
          return const Text('loading ...', style: TextStyle(fontSize: 32));
        }

        final entries = appList.searchEntries(filterKey);

        return ListView.builder(
          // Keep the strongest fzf-style match nearest the search field.
          // A reversed list lays item zero out at the bottom of the screen.
          reverse: filterKey.isNotEmpty,
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final match = entries[index];
            final entry = match.entry;
            return GestureDetector(
              child: ListTile(
                title: _FuzzyHighlightedText(
                  text: entry.title,
                  matchedIndexes: match.titleMatch?.matchedIndexes ?? const {},
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              onTap: () async {
                await _openEntry(context, entry);
                onAppOpen();
              },
              onLongPress: () => _showEntryActions(context, entry),
            );
          },
        );
      },
    );
  }
}

Future<void> _showGlobalActions(BuildContext context) async {
  final appList = context.read<AppListCacher>();
  final action = await showModalBottomSheet<GlobalAction>(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text('Set up home'),
              onTap: () => Navigator.pop(context, GlobalAction.setupHome),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Launcher settings'),
              onTap: () =>
                  Navigator.pop(context, GlobalAction.launcherSettings),
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Refresh apps'),
              onTap: () => Navigator.pop(context, GlobalAction.refreshApps),
            ),
            ListTile(
              leading: const Icon(Icons.file_upload),
              title: const Text('Export grid'),
              onTap: () => Navigator.pop(context, GlobalAction.exportGridJson),
            ),
            ListTile(
              leading: const Icon(Icons.file_download),
              title: const Text('Import grid'),
              onTap: () => Navigator.pop(context, GlobalAction.importGridJson),
            ),
          ],
        ),
      );
    },
  );

  if (!context.mounted) {
    return;
  }

  switch (action) {
    case GlobalAction.setupHome:
      await _showHomeSetup(context);
    case GlobalAction.launcherSettings:
      await _showLauncherSettings(context);
    case GlobalAction.refreshApps:
      await appList.updateCache();
    case GlobalAction.exportGridJson:
      if (appList.data == null) {
        return;
      }
      final body =
          json.encode(appList.data!.grid.map((x) => x.toJson()).toList());
      await LauncherBridge.saveTextFile(
        fileName: 'nkit_launcher_grid.json',
        content: body,
      );
    case GlobalAction.importGridJson:
      final file = await LauncherBridge.pickFile(mimeType: 'application/json');
      if (file != null) {
        final fileContent = File(file).readAsStringSync();
        final content = json.decode(fileContent);
        await appList.setGridCache(
          (content as List)
              .map((x) => GridApp.fromJson(Map<String, dynamic>.from(x as Map)))
              .toList(),
        );
      }
    case null:
  }
}

Future<void> _showHomeSetup(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => const _HomeSetupSheet(),
  );
}

class _HomeSetupSheet extends StatefulWidget {
  const _HomeSetupSheet();

  @override
  State<_HomeSetupSheet> createState() => _HomeSetupSheetState();
}

class _HomeSetupSheetState extends State<_HomeSetupSheet> {
  final TextEditingController _filterController = TextEditingController();
  String _filter = '';

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.88,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.add), text: 'Add'),
                Tab(icon: Icon(Icons.drag_handle), text: 'Arrange'),
              ],
            ),
            Expanded(
              child: Consumer<AppListCacher>(
                builder: (context, appList, child) {
                  if (appList.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return TabBarView(
                    children: [
                      _buildAddTab(context, appList),
                      _buildArrangeTab(context, appList),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddTab(BuildContext context, AppListCacher appList) {
    final entries = appList.searchEntries(_filter);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _filterController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              hintText: 'Search apps and shortcuts',
            ),
            onChanged: (value) => setState(() => _filter = value),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final match = entries[index];
              final entry = match.entry;
              final isOnGrid =
                  appList.data!.grid.any((item) => item.entryId == entry.id);
              return CheckboxListTile(
                secondary: _EntryIcon(
                  entry: entry,
                  size: 28,
                  fallback: _defaultIconForEntry(entry),
                ),
                value: isOnGrid,
                title: _FuzzyHighlightedText(
                  text: entry.title,
                  matchedIndexes: match.titleMatch?.matchedIndexes ?? const {},
                ),
                subtitle: Text(
                  entry.type == LauncherEntryType.shortcut
                      ? 'Shortcut - ${entry.packageName}'
                      : entry.packageName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onChanged: (checked) {
                  if (checked == true) {
                    appList.addToGrid(entry);
                  } else {
                    appList.removeFromGrid(entry.id);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildArrangeTab(BuildContext context, AppListCacher appList) {
    final grid = appList.data!.grid;
    if (grid.isEmpty) {
      return const Center(child: Text('Home is empty'));
    }
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 4),
          child:
              Text('Long press, then drag over a tile to move into its spot.'),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: grid.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: appList.settings.homeColumns,
              childAspectRatio: 1.5,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final item = grid[index];
              final entry = appList.entryFor(item);
              if (entry == null) {
                return const SizedBox.shrink();
              }
              return DragTarget<String>(
                key: ValueKey('arrange-target-${item.entryId}'),
                onWillAcceptWithDetails: (details) {
                  if (details.data == item.entryId) {
                    return false;
                  }
                  final currentGrid = appList.data!.grid;
                  final oldIndex = currentGrid.indexWhere(
                    (gridItem) => gridItem.entryId == details.data,
                  );
                  final targetIndex = currentGrid.indexWhere(
                    (gridItem) => gridItem.entryId == item.entryId,
                  );
                  if (oldIndex >= 0 && targetIndex >= 0) {
                    appList.moveGridItemToIndexLive(oldIndex, targetIndex);
                  }
                  return true;
                },
                builder: (context, candidateData, __) {
                  _ArrangeGridTile tile({bool isDropTarget = false}) {
                    return _ArrangeGridTile(
                      item: item,
                      entry: entry,
                      isDropTarget: isDropTarget,
                      onSelectIcon: () => _selectGridIcon(context, index),
                      onRemove: () => appList.removeFromGrid(item.entryId),
                    );
                  }

                  return LongPressDraggable<String>(
                    key: ValueKey('arrange-drag-${item.entryId}'),
                    data: item.entryId,
                    onDragEnd: (_) async => appList.flushChanges(),
                    feedback: Material(
                      color: Colors.transparent,
                      child: SizedBox(width: 150, child: tile()),
                    ),
                    childWhenDragging: Opacity(opacity: 0.25, child: tile()),
                    child: tile(isDropTarget: candidateData.isNotEmpty),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ArrangeGridTile extends StatelessWidget {
  const _ArrangeGridTile({
    required this.item,
    required this.entry,
    required this.isDropTarget,
    required this.onSelectIcon,
    required this.onRemove,
  });

  final GridApp item;
  final LauncherEntry entry;
  final bool isDropTarget;
  final VoidCallback onSelectIcon;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isDropTarget
            ? Theme.of(context).colorScheme.secondaryContainer
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: isDropTarget
            ? Border.all(color: Theme.of(context).colorScheme.primary, width: 2)
            : null,
      ),
      child: Stack(
        children: [
          Center(child: _gridIcon(item, entry, size: 36)),
          Positioned(
            left: 2,
            bottom: 2,
            child: IconButton(
              icon: const Icon(Icons.palette, size: 18),
              tooltip: 'Choose icon',
              onPressed: onSelectIcon,
            ),
          ),
          Positioned(
            right: 2,
            bottom: 2,
            child: IconButton(
              icon: const Icon(Icons.remove_circle_outline, size: 18),
              tooltip: 'Remove from home',
              onPressed: onRemove,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _showLauncherSettings(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => const _LauncherSettingsSheet(),
  );
}

class _LauncherSettingsSheet extends StatelessWidget {
  const _LauncherSettingsSheet();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.72,
      child: Consumer<AppListCacher>(
        builder: (context, appList, child) {
          final settings = appList.settings;
          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Launcher settings'),
              ),
              ListTile(
                leading: const Icon(Icons.contrast),
                title: const Text('Theme mode'),
                subtitle: Text(_themeModeLabel(settings.themeMode)),
                onTap: () => _showThemeModeDialog(context),
              ),
              ListTile(
                leading: const Icon(Icons.wallpaper),
                title: const Text('Wallpapers'),
                subtitle: const Text('Light and dark wallpaper'),
                onTap: () => _showWallpaperDialog(context),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.grid_view),
                title: const Text('Home grid columns'),
                subtitle: Text('${settings.homeColumns} columns'),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: settings.homeColumns,
                    items: List.generate(
                      5,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text('${index + 1}'),
                      ),
                    ),
                    onChanged: (columns) {
                      if (columns != null) {
                        appList.updateSettings(
                          settings.copyWith(homeColumns: columns),
                        );
                      }
                    },
                  ),
                ),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.blur_on),
                title: Text('Frost effect'),
                subtitle:
                    Text('Used by search, the search bar, and icon tiles'),
              ),
              _FrostControls(settings: settings),
              SwitchListTile(
                secondary: const Icon(Icons.blur_on),
                title: const Text('Frosted icon backgrounds'),
                subtitle:
                    const Text('Add a frosted rectangle behind home icons'),
                value: settings.frostedIconBackgrounds,
                onChanged: (enabled) => appList.updateSettings(
                  settings.copyWith(frostedIconBackgrounds: enabled),
                ),
              ),
              if (settings.frostedIconBackgrounds)
                _IconBackgroundControls(settings: settings),
            ],
          );
        },
      ),
    );
  }
}

String _themeModeLabel(ThemeMode mode) {
  return switch (mode) {
    ThemeMode.system => 'System default',
    ThemeMode.light => 'Light',
    ThemeMode.dark => 'Dark',
  };
}

class _FrostControls extends StatefulWidget {
  const _FrostControls({required this.settings});

  final LauncherSettings settings;

  @override
  State<_FrostControls> createState() => _FrostControlsState();
}

class _FrostControlsState extends State<_FrostControls> {
  late double _blur = widget.settings.frostBlur;
  late double _opacity = widget.settings.frostOpacity;

  Future<void> _save() {
    return context.read<AppListCacher>().updateSettings(
          widget.settings.copyWith(frostBlur: _blur, frostOpacity: _opacity),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Blur: ${_blur.round()} px'),
          Slider(
            value: _blur,
            min: 0,
            max: 30,
            divisions: 30,
            label: '${_blur.round()} px',
            onChanged: (value) => setState(() => _blur = value),
            onChangeEnd: (_) => _save(),
          ),
          Text('Opacity: ${(_opacity * 100).round()}%'),
          Slider(
            value: _opacity,
            min: 0.05,
            max: 0.9,
            divisions: 17,
            label: '${(_opacity * 100).round()}%',
            onChanged: (value) => setState(() => _opacity = value),
            onChangeEnd: (_) => _save(),
          ),
        ],
      ),
    );
  }
}

class _IconBackgroundControls extends StatefulWidget {
  const _IconBackgroundControls({required this.settings});

  final LauncherSettings settings;

  @override
  State<_IconBackgroundControls> createState() =>
      _IconBackgroundControlsState();
}

class _IconBackgroundControlsState extends State<_IconBackgroundControls> {
  late double _radius = widget.settings.iconBackgroundRadius;
  late double _padding = widget.settings.iconBackgroundPadding;

  Future<void> _save() {
    return context.read<AppListCacher>().updateSettings(
          widget.settings.copyWith(
            iconBackgroundRadius: _radius,
            iconBackgroundPadding: _padding,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Icon background corner radius: ${_radius.round()} px'),
          Slider(
            value: _radius,
            min: 0,
            max: 32,
            divisions: 32,
            label: '${_radius.round()} px',
            onChanged: (value) => setState(() => _radius = value),
            onChangeEnd: (_) => _save(),
          ),
          Text('Space around each icon: ${_padding.round()} px'),
          Slider(
            value: _padding,
            min: 0,
            max: 24,
            divisions: 24,
            label: '${_padding.round()} px',
            onChanged: (value) => setState(() => _padding = value),
            onChangeEnd: (_) => _save(),
          ),
        ],
      ),
    );
  }
}

Future<void> _showThemeModeDialog(BuildContext context) async {
  final appList = context.read<AppListCacher>();
  final mode = await showDialog<ThemeMode>(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Text('Theme mode'),
      children: [
        RadioGroup<ThemeMode>(
          groupValue: appList.settings.themeMode,
          onChanged: (value) => Navigator.pop(context, value),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                value: ThemeMode.system,
                title: Text('System'),
              ),
              RadioListTile<ThemeMode>(
                value: ThemeMode.light,
                title: Text('Light'),
              ),
              RadioListTile<ThemeMode>(
                value: ThemeMode.dark,
                title: Text('Dark'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  if (mode != null) {
    await appList.updateSettings(appList.settings.copyWith(themeMode: mode));
  }
}

Future<void> _showWallpaperDialog(BuildContext context) async {
  final appList = context.read<AppListCacher>();
  final action = await showDialog<WallpaperAction>(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Text('Wallpaper'),
      children: [
        _WallpaperOption(
          label: 'Pick light wallpaper',
          previewPath: appList.settings.lightWallpaperPath ??
              appList.settings.darkWallpaperPath,
          onPressed: () => Navigator.pop(context, WallpaperAction.pickLight),
        ),
        _WallpaperOption(
          label: 'Pick dark wallpaper',
          previewPath: appList.settings.darkWallpaperPath ??
              appList.settings.lightWallpaperPath,
          onPressed: () => Navigator.pop(context, WallpaperAction.pickDark),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, WallpaperAction.clearLight),
          child: const Text('Clear light wallpaper'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, WallpaperAction.clearDark),
          child: const Text('Clear dark wallpaper'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, WallpaperAction.clearBoth),
          child: const Text('Clear all wallpapers'),
        ),
      ],
    ),
  );

  if (!context.mounted) {
    return;
  }

  switch (action) {
    case WallpaperAction.pickLight:
      final wallpaper = await _pickAndEditWallpaper(context);
      if (wallpaper != null) {
        await appList.updateSettings(
          appList.settings.copyWith(lightWallpaper: wallpaper),
        );
      }
    case WallpaperAction.pickDark:
      final wallpaper = await _pickAndEditWallpaper(context);
      if (wallpaper != null) {
        await appList.updateSettings(
          appList.settings.copyWith(darkWallpaper: wallpaper),
        );
      }
    case WallpaperAction.clearLight:
      await appList.updateSettings(
        appList.settings.copyWith(clearLightWallpaper: true),
      );
    case WallpaperAction.clearDark:
      await appList.updateSettings(
        appList.settings.copyWith(clearDarkWallpaper: true),
      );
    case WallpaperAction.clearBoth:
      await appList.updateSettings(
        appList.settings.copyWith(
          clearLightWallpaper: true,
          clearDarkWallpaper: true,
        ),
      );
    case null:
  }
}

Future<WallpaperAppearance?> _pickAndEditWallpaper(BuildContext context) async {
  final rootNavigator = Navigator.of(context, rootNavigator: true);
  showDialog<void>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    builder: (context) => const PopScope(
      canPop: false,
      child: AlertDialog(
        content: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
            SizedBox(width: 20),
            Expanded(child: Text('Loading wallpaper…')),
          ],
        ),
      ),
    ),
  );
  // Ensure the overlay has been painted before the system picker takes over.
  await WidgetsBinding.instance.endOfFrame;
  String? path;
  try {
    path = await LauncherBridge.pickFile(mimeType: 'image/*');
  } finally {
    // Home can dismiss this dialog while the native picker is open. Never pop
    // the only remaining route when its delayed result arrives afterward.
    if (context.mounted && rootNavigator.canPop()) {
      rootNavigator.pop();
    }
  }
  if (!context.mounted || path == null) {
    return null;
  }
  return showModalBottomSheet<WallpaperAppearance>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _WallpaperEditor(path: path!),
  );
}

class _WallpaperEditor extends StatefulWidget {
  const _WallpaperEditor({required this.path});

  final String path;

  @override
  State<_WallpaperEditor> createState() => _WallpaperEditorState();
}

class _WallpaperEditorState extends State<_WallpaperEditor> {
  double _cropScale = 1;
  double _cropX = 0;
  double _cropY = 0;
  bool _frosted = false;
  double _frostBlur = 12;
  double _frostOpacity = 0.32;
  double _frostTint = 0.92;

  WallpaperAppearance get _wallpaper => WallpaperAppearance(
        path: widget.path,
        cropScale: _cropScale,
        cropX: _cropX,
        cropY: _cropY,
        frosted: _frosted,
        frostBlur: _frostBlur,
        frostOpacity: _frostOpacity,
        frostTint: _frostTint,
      );

  void _moveCrop(DragUpdateDetails details, BoxConstraints constraints) {
    setState(() {
      _cropX = (_cropX - details.delta.dx / (constraints.maxWidth / 2))
          .clamp(-1.0, 1.0);
      _cropY = (_cropY - details.delta.dy / (constraints.maxHeight / 2))
          .clamp(-1.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final previewHeight = MediaQuery.sizeOf(context).height * 0.34;
    final bottomSafeArea = MediaQuery.paddingOf(context).bottom;
    return Material(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 12, 4),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  tooltip: 'Cancel',
                  onPressed: () => Navigator.pop(context),
                ),
                const Expanded(
                  child: Text(
                    'Edit wallpaper',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text('Use wallpaper'),
                  onPressed: () => Navigator.pop(context, _wallpaper),
                ),
              ],
            ),
          ),
          SizedBox(
            height: previewHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) => GestureDetector(
                  onPanUpdate: (details) => _moveCrop(details, constraints),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          _WallpaperImage(wallpaper: _wallpaper),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.55),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'Drag to position the crop',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 8 + bottomSafeArea),
              children: [
                Text('Crop zoom: ${_cropScale.toStringAsFixed(1)}×'),
                Slider(
                  value: _cropScale,
                  min: 1,
                  max: 3,
                  divisions: 20,
                  label: '${_cropScale.toStringAsFixed(1)}×',
                  onChanged: (value) => setState(() => _cropScale = value),
                ),
                Row(
                  children: [
                    const Expanded(child: Text('Crop position')),
                    TextButton.icon(
                      icon: const Icon(Icons.center_focus_strong, size: 18),
                      label: const Text('Center'),
                      onPressed: () => setState(() {
                        _cropX = 0;
                        _cropY = 0;
                      }),
                    ),
                  ],
                ),
                Text('Horizontal: ${(_cropX * 100).round()}%'),
                Slider(
                  value: _cropX,
                  min: -1,
                  max: 1,
                  divisions: 20,
                  onChanged: (value) => setState(() => _cropX = value),
                ),
                Text('Vertical: ${(_cropY * 100).round()}%'),
                Slider(
                  value: _cropY,
                  min: -1,
                  max: 1,
                  divisions: 20,
                  onChanged: (value) => setState(() => _cropY = value),
                ),
                const Divider(height: 32),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: const Icon(Icons.blur_on),
                  title: const Text('Frost the wallpaper'),
                  subtitle: const Text('Blur and tint the image before use'),
                  value: _frosted,
                  onChanged: (value) => setState(() => _frosted = value),
                ),
                if (_frosted) ...[
                  Text('Blur: ${_frostBlur.round()} px'),
                  Slider(
                    value: _frostBlur,
                    min: 0,
                    max: 30,
                    divisions: 30,
                    label: '${_frostBlur.round()} px',
                    onChanged: (value) => setState(() => _frostBlur = value),
                  ),
                  Text('Tint opacity: ${(_frostOpacity * 100).round()}%'),
                  Slider(
                    value: _frostOpacity,
                    min: 0,
                    max: 0.8,
                    divisions: 16,
                    label: '${(_frostOpacity * 100).round()}%',
                    onChanged: (value) => setState(() => _frostOpacity = value),
                  ),
                  Text('Tint: ${(_frostTint * 100).round()}% light'),
                  Slider(
                    value: _frostTint,
                    min: 0,
                    max: 1,
                    divisions: 20,
                    label: '${(_frostTint * 100).round()}% light',
                    onChanged: (value) => setState(() => _frostTint = value),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WallpaperOption extends StatelessWidget {
  const _WallpaperOption({
    required this.label,
    required this.previewPath,
    required this.onPressed,
  });

  final String label;
  final String? previewPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(child: Text(label)),
          const SizedBox(width: 12),
          SizedBox(
            width: 88,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: previewPath == null
                  ? ColoredBox(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      child: const Center(child: Text('Default')),
                    )
                  : Image.file(
                      File(previewPath!),
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => ColoredBox(
                        color:
                            Theme.of(context).colorScheme.surfaceContainerHigh,
                        child: const Center(child: Icon(Icons.broken_image)),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _showGridItemActions(BuildContext context, int index) async {
  final appList = context.read<AppListCacher>();
  final item = appList.data!.grid[index];
  final entry = appList.entryFor(item);
  if (entry == null) {
    return;
  }

  final action = await showDialog<GridIconAction>(
    context: context,
    builder: (context) => SimpleDialog(
      title: _entryDialogTitle(entry),
      children: [
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, GridIconAction.selectIcon),
          child: const Text('Select icon'),
        ),
        SimpleDialogOption(
          onPressed: () =>
              Navigator.pop(context, GridIconAction.openAppSettings),
          child: const Text('Open app settings'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, GridIconAction.remove),
          child: const Text('Remove from home'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, GridIconAction.deleteApp),
          child: const Text('Uninstall app'),
        ),
      ],
    ),
  );

  if (!context.mounted) {
    return;
  }

  switch (action) {
    case GridIconAction.selectIcon:
      await _selectGridIcon(context, index);
    case GridIconAction.openAppSettings:
      await LauncherBridge.openAppSettings(entry.packageName);
    case GridIconAction.remove:
      await appList.removeFromGrid(item.entryId);
    case GridIconAction.deleteApp:
      await LauncherBridge.uninstallPackage(entry.packageName);
    case null:
  }
}

Future<void> _showEntryActions(
    BuildContext context, LauncherEntry entry) async {
  final appList = context.read<AppListCacher>();
  final action = await showDialog<AppAction>(
    context: context,
    builder: (context) => SimpleDialog(
      title: _entryDialogTitle(entry),
      children: [
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, AppAction.addToGrid),
          child: const Text('Add to home'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, AppAction.openAppSettings),
          child: const Text('Open app settings'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, AppAction.deleteApp),
          child: const Text('Uninstall app'),
        ),
      ],
    ),
  );

  switch (action) {
    case AppAction.addToGrid:
      await appList.addToGrid(entry);
    case AppAction.openAppSettings:
      await LauncherBridge.openAppSettings(entry.packageName);
    case AppAction.deleteApp:
      await LauncherBridge.uninstallPackage(entry.packageName);
    case null:
  }
}

Widget _entryDialogTitle(LauncherEntry entry) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(entry.title),
      const SizedBox(height: 8),
      Text(entry.packageName, style: const TextStyle(fontSize: 13)),
      Text(
        'Version ${entry.versionName ?? 'Unknown'}',
        style: const TextStyle(fontSize: 13),
      ),
    ],
  );
}

Future<void> _selectGridIcon(BuildContext context, int index) async {
  final appList = context.read<AppListCacher>();
  final item = appList.data!.grid[index];
  final selected = await _pickIcon(context, item.icon);
  if (selected != null) {
    item.icon = selected;
    item.iconSlug = null;
    await appList.flushChanges();
  }
}

Future<Map<String, dynamic>?> _pickIcon(
  BuildContext context,
  Map<String, dynamic>? currentIcon,
) async {
  final selected = await showIconSearchPicker(
    context,
    selected: currentIcon == null ? null : iconFromJson(currentIcon),
  );
  return selected?.toJson();
}

IconData _iconForGridItem(GridApp item, LauncherEntry entry) {
  if (item.icon != null) {
    final icon = iconFromJson(item.icon!);
    if (icon != null) {
      return icon.data;
    }
  }
  if (item.iconSlug != null && icons[item.iconSlug] != null) {
    return icons[item.iconSlug]!;
  }
  return _defaultIconForEntry(entry);
}

IconData _defaultIconForEntry(LauncherEntry entry) {
  return entry.type == LauncherEntryType.shortcut
      ? Icons.open_in_new
      : Icons.apps;
}

Future<void> _openEntry(BuildContext context, LauncherEntry entry) async {
  try {
    await LauncherBridge.openEntry(entry.toJson());
  } catch (error) {
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Could not open ${entry.title}')),
    );
  }
}

enum GlobalAction {
  setupHome,
  launcherSettings,
  refreshApps,
  exportGridJson,
  importGridJson,
}

enum WallpaperAction {
  pickLight,
  pickDark,
  clearLight,
  clearDark,
  clearBoth,
}

enum GridIconAction { selectIcon, openAppSettings, remove, deleteApp }

enum AppAction { addToGrid, openAppSettings, deleteApp }
