import 'dart:async';

import 'package:flutter/material.dart';

import 'catalog.dart';
import 'icon_choice.dart';

Future<IconChoice?> showIconSearchPicker(
  BuildContext context, {
  IconChoice? selected,
}) {
  return showDialog<IconChoice>(
    context: context,
    builder: (_) => _IconSearchPicker(selected: selected),
  );
}

class _IconSearchPicker extends StatefulWidget {
  const _IconSearchPicker({this.selected});

  final IconChoice? selected;

  @override
  State<_IconSearchPicker> createState() => _IconSearchPickerState();
}

class _IconSearchPickerState extends State<_IconSearchPicker> {
  final TextEditingController _queryController = TextEditingController();
  String _query = '';
  String? _pack = 'allMaterial';
  bool _outlinedOnly = true;
  bool _showIconNames = false;
  Timer? _queryDebounce;

  static const _preferredIconNames = <String>{
    'photo_camera_outlined',
    'camera_outlined',
    'call_outlined',
    'headset_outlined',
    'credit_card_outlined',
    'payments_outlined',
    'payment_outlined',
    'wb_twilight_outlined',
    'podcasts_outlined',
    'history_edu_outlined',
    'sync_outlined',
    'sync_alt_outlined',
    'map_outlined',
    'place_outlined',
    'web_outlined',
    'calendar_month_outlined',
    'calendar_today_outlined',
    'date_range_outlined',
    'calculate_outlined',
    'schedule_outlined',
    'folder_outlined',
    'folder_open_outlined',
    'folder_copy_outlined',
    'fitbit',
    'home_outlined',
    'chat_outlined',
    'mail_outlined',
    'email_outlined',
    'message_outlined',
    'forum_outlined',
    'settings_outlined',
    'edit_outlined',
    'notes_outlined',
    'description_outlined',
    'article_outlined',
    'bookmark_outlined',
    'play_circle_outlined',
    'image_outlined',
    'photo_outlined',
    'music_note_outlined',
    'headphones_outlined',
    'shopping_bag_outlined',
    'shopping_cart_outlined',
    'local_shipping_outlined',
    'directions_car_outlined',
    'train_outlined',
    'flight_outlined',
    'lock_outlined',
    'key_outlined',
    'cloud_outlined',
    'download_outlined',
    'upload_outlined',
    'terminal_outlined',
    'code_outlined',
  };

  List<IconChoice> get _matchingIcons {
    final query = _query.trim().toLowerCase();
    final candidates = searchableIcons.where((icon) {
      final inPack = _pack == null || icon.pack == _pack;
      final matchesStyle = !_outlinedOnly || icon.name.endsWith('_outlined');
      return inPack && matchesStyle;
    });
    if (query.isEmpty) {
      final preferred = candidates
          .where((icon) => _preferredIconNames.contains(icon.name))
          .toList(growable: false);
      return preferred.isNotEmpty
          ? preferred
          : candidates.take(80).toList(growable: false);
    }

    final matches = <({IconChoice icon, int score})>[];
    for (final icon in candidates) {
      final score = _fuzzyScore(icon.name, query);
      if (score != null) {
        matches.add((icon: icon, score: score));
      }
    }
    matches.sort((a, b) {
      final score = a.score.compareTo(b.score);
      return score != 0 ? score : a.icon.name.compareTo(b.icon.name);
    });
    return matches.map((match) => match.icon).toList(growable: false);
  }

  int? _fuzzyScore(String name, String query) {
    final haystack = name.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    final needle = query.replaceAll(RegExp(r'[^a-z0-9]'), '');
    if (needle.isEmpty) {
      return 0;
    }
    final directIndex = haystack.indexOf(needle);
    if (directIndex >= 0) {
      return directIndex * 2;
    }

    var needleIndex = 0;
    var previousMatch = -1;
    var gaps = 0;
    for (var index = 0; index < haystack.length; index++) {
      if (haystack[index] != needle[needleIndex]) {
        continue;
      }
      if (previousMatch >= 0) {
        gaps += index - previousMatch - 1;
      } else {
        gaps += index;
      }
      previousMatch = index;
      needleIndex++;
      if (needleIndex == needle.length) {
        return 100 + gaps + haystack.length - needle.length;
      }
    }
    return null;
  }

  void _setQuery(String value) {
    _queryDebounce?.cancel();
    _queryDebounce = Timer(const Duration(milliseconds: 90), () {
      if (mounted) {
        setState(() => _query = value);
      }
    });
  }

  @override
  void dispose() {
    _queryDebounce?.cancel();
    _queryController.dispose();
    super.dispose();
  }

  void _applyFilter(String value) {
    if (value == 'outlined') {
      setState(() => _outlinedOnly = !_outlinedOnly);
      return;
    }
    setState(() => _pack = value == 'all' ? null : value);
  }

  @override
  Widget build(BuildContext context) {
    final icons = _matchingIcons;
    final packs = <String, String>{
      'allMaterial': 'Material',
      'cupertino': 'Cupertino',
      'fontAwesomeIcons': 'Font Awesome',
      'lineAwesomeIcons': 'Line Awesome',
    };

    return Dialog(
      insetPadding: const EdgeInsets.all(12),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720, maxHeight: 760),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () =>
                          setState(() => _showIconNames = !_showIconNames),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: _showIconNames,
                            visualDensity: VisualDensity.compact,
                            onChanged: (value) =>
                                setState(() => _showIconNames = value ?? false),
                          ),
                          const Text('Names'),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    tooltip: 'Filter icons',
                    icon: const Icon(Icons.tune),
                    onSelected: _applyFilter,
                    itemBuilder: (context) => [
                      CheckedPopupMenuItem(
                        value: 'outlined',
                        checked: _outlinedOnly,
                        child: const Text('Outlined only'),
                      ),
                      const PopupMenuDivider(),
                      CheckedPopupMenuItem(
                        value: 'all',
                        checked: _pack == null,
                        child: const Text('All icon packs'),
                      ),
                      for (final entry in packs.entries)
                        CheckedPopupMenuItem(
                          value: entry.key,
                          checked: _pack == entry.key,
                          child: Text(entry.value),
                        ),
                    ],
                  ),
                  IconButton(
                    tooltip: 'Close',
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              TextField(
                controller: _queryController,
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Fuzzy-search icons',
                  isDense: true,
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Clear search',
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _queryDebounce?.cancel();
                            _queryController.clear();
                            setState(() => _query = '');
                          },
                        ),
                ),
                onChanged: _setQuery,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _query.isEmpty
                      ? '${icons.length} preferred icons'
                      : '${icons.length} fuzzy matches',
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: icons.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: _showIconNames ? 88 : 72,
                    mainAxisExtent: _showIconNames ? 74 : 68,
                  ),
                  itemBuilder: (context, index) {
                    final icon = icons[index];
                    final isSelected = widget.selected?.pack == icon.pack &&
                        widget.selected?.name == icon.name;
                    return RepaintBoundary(
                      child: Tooltip(
                        message: '${icon.name} (${icon.pack})',
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () => Navigator.pop(context, icon),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icon.data,
                                  size: _showIconNames ? 24 : 32,
                                ),
                                if (_showIconNames) ...[
                                  const SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    child: Text(
                                      icon.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
