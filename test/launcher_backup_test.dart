import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nkit_launcher/app_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

LauncherEntry shortcut(String id, {bool browser = false}) => LauncherEntry(
      id: 'shortcut:example:$id:0',
      title: id,
      packageName: 'example',
      shortcutId: id,
      userHash: 0,
      type: LauncherEntryType.shortcut,
      searchableByDefault: browser,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('nkit_launcher/launcher');
  final home = shortcut('home');
  final search = shortcut('search');
  final browser = shortcut('browser', browser: true);
  final hidden = shortcut('hidden', browser: true);
  var nativeEntries = <LauncherEntry>[];
  final pinned = <String>[];
  final wallpaperBytes = <int>[];
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    nativeEntries = [home, search, browser, hidden];
    pinned.clear();
    wallpaperBytes.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'getEntries') {
        return nativeEntries.map((entry) => entry.toJson()).toList();
      }
      if (call.method == 'pinShortcut') {
        pinned.add((call.arguments as Map)['id'] as String);
      }
      if (call.method == 'restoreWallpaper') {
        wallpaperBytes.addAll(call.arguments as Uint8List);
        return '/restored/wallpaper.png';
      }
      return null;
    });
  });
  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test(
      'backup restores home icons, search-only and browser shortcuts, and exclusions',
      () async {
    final original = AppListCacher()
      ..data = CacheData(
        [
          GridApp(home.id, icon: {'pack': 'material', 'codePoint': 123})
        ],
        {for (final e in nativeEntries) e.id: e},
        includedShortcutIds: {search.id},
        hiddenShortcutIds: {hidden.id},
      );
    final backup = await original.exportBackup();
    // The destination hasn't pinned this browser entry yet.
    nativeEntries = [home, search, shortcut('browser'), hidden];
    final restored = AppListCacher();
    expect(await restored.importBackup(backup), 0);
    expect(restored.data!.grid.single.icon!['codePoint'], 123);
    expect(restored.searchableEntries().map((e) => e.id),
        containsAll([home.id, search.id, browser.id]));
    expect(restored.isShortcutIncluded(hidden), isFalse);
    expect(pinned, containsAll([home.id, search.id, browser.id]));
    final restarted = AppListCacher();
    await restarted.readCache();
    expect(restarted.data!.includedShortcutIds, contains(search.id));
    expect(restarted.data!.hiddenShortcutIds, contains(hidden.id));
  });

  test(
      'missing shortcuts retain metadata through refresh, re-export and restart',
      () async {
    final original = AppListCacher()
      ..data = CacheData(
        [GridApp(home.id)],
        {home.id: home, browser.id: browser},
      );
    final backup = await original.exportBackup();
    nativeEntries = [];
    final restored = AppListCacher();
    expect(await restored.importBackup(backup), 2);
    await restored.updateCache();
    expect(restored.entryFor(restored.data!.grid.single), isNull);
    expect(restored.titleFor(restored.data!.grid.single), 'home');
    expect((jsonDecode(await restored.exportBackup())['entries'] as Map).keys,
        containsAll([home.id, browser.id]));
    final restarted = AppListCacher();
    await restarted.readCache();
    nativeEntries = [home, browser];
    await restarted.updateCache();
    expect(restarted.entryFor(restarted.data!.grid.single)?.id, home.id);
  });

  test('legacy grid-only backups remain supported', () async {
    final restored = AppListCacher()
      ..data = CacheData([], {}, includedShortcutIds: {search.id});
    expect(await restored.importBackup(jsonEncode([GridApp(home.id).toJson()])),
        0);
    expect(restored.data!.grid.single.entryId, home.id);
    expect(restored.data!.includedShortcutIds, contains(search.id));
  });

  test('invalid backup does not change existing layout', () async {
    final restored = AppListCacher()..data = CacheData([GridApp(home.id)], {});
    await expectLater(
        restored.importBackup('{"version":99}'), throwsFormatException);
    expect(restored.data!.grid.single.entryId, home.id);
  });

  test('installed version 1 backups restore shortcuts and wallpaper settings',
      () async {
    final restored = AppListCacher();
    expect(
        await restored.importBackup(jsonEncode({
          'format': 'nkit-launcher-backup',
          'version': 1,
          'grid': [GridApp(home.id).toJson()],
          'includedShortcutIds': [search.id],
          'hiddenShortcutIds': [hidden.id],
          'settings': {
            'homeColumns': 3,
            'darkWallpaper': {
              'data': base64Encode([1, 2, 3]),
              'cropScale': 2.0,
            }
          },
        })),
        0);
    expect(restored.settings.homeColumns, 3);
    expect(restored.settings.darkWallpaper?.path, '/restored/wallpaper.png');
    expect(restored.settings.darkWallpaper?.cropScale, 2);
    expect(wallpaperBytes, [1, 2, 3]);
    expect(restored.isShortcutIncluded(search), isTrue);
    expect(restored.isShortcutIncluded(hidden), isFalse);
  });

  test('exports embed wallpaper bytes and restore their appearance', () async {
    final directory =
        await Directory.systemTemp.createTemp('launcher-backup-test');
    addTearDown(() => directory.delete(recursive: true));
    final file =
        await File('${directory.path}/wallpaper.png').writeAsBytes([1, 2, 3]);
    final original = AppListCacher()
      ..data = CacheData([], {})
      ..settings = LauncherSettings(
          homeColumns: 4,
          lightWallpaper: WallpaperAppearance(path: file.path, frosted: true));
    final backup = await original.exportBackup();
    expect(backup, isNot(contains(file.path)));
    final restored = AppListCacher();
    await restored.importBackup(backup);
    expect(wallpaperBytes, [1, 2, 3]);
    expect(restored.settings.homeColumns, 4);
    expect(restored.settings.lightWallpaper?.frosted, isTrue);
  });

  test(
      'changed launcher alias recovers only an unambiguous app in the same profile',
      () async {
    final current = LauncherEntry(
        id: 'activity:medito/Main.classic:0',
        title: 'Medito',
        packageName: 'medito',
        userHash: 0,
        type: LauncherEntryType.activity);
    nativeEntries = [current];
    final cacher = AppListCacher()
      ..data = CacheData([
        GridApp('activity:medito/Main.dusk:0', iconSlug: 'flower'),
        GridApp('activity:medito/Main.dusk:10'),
      ], {});
    await cacher.updateCache();
    expect(cacher.data!.grid.first.entryId, current.id);
    expect(cacher.data!.grid.first.iconSlug, 'flower');
    expect(cacher.data!.grid.last.entryId, 'activity:medito/Main.dusk:10');
  });

  test('replacement preserves position and icon without duplicate selection',
      () async {
    final missing = GridApp('missing', iconSlug: 'phone');
    final cacher = AppListCacher()
      ..data = CacheData(
        [GridApp(search.id), missing, GridApp(home.id)],
        {home.id: home, search.id: search},
      );
    await cacher.replaceGridItem(missing, home);
    expect(cacher.data!.grid.map((e) => e.entryId), [search.id, home.id]);
    expect(cacher.data!.grid.last.iconSlug, 'phone');
    expect(pinned, [home.id]);
  });
}
