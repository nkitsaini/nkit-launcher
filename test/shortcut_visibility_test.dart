import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nkit_launcher/app_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

LauncherEntry _entry({
  required String id,
  required String title,
  required LauncherEntryType type,
  bool searchableByDefault = false,
}) {
  return LauncherEntry(
    id: id,
    title: title,
    packageName: 'com.example.app',
    type: type,
    searchableByDefault: searchableByDefault,
  );
}

void main() {
  test('included shortcuts are searchable and removed shortcuts stay hidden',
      () {
    final app = _entry(
      id: 'activity:com.example.app/Main:0',
      title: 'Example',
      type: LauncherEntryType.activity,
    );
    final quickAction = _entry(
      id: 'shortcut:com.example.app/new:0',
      title: 'New item',
      type: LauncherEntryType.shortcut,
    );
    final browserShortcut = _entry(
      id: 'shortcut:com.example.app/browser:0',
      title: 'Website',
      type: LauncherEntryType.shortcut,
      searchableByDefault: true,
    );
    final cacher = AppListCacher()
      ..data = CacheData(
        [],
        {
          app.id: app,
          quickAction.id: quickAction,
          browserShortcut.id: browserShortcut,
        },
      );

    expect(
      cacher.searchableEntries().map((entry) => entry.id),
      containsAll(<String>[app.id, browserShortcut.id]),
    );
    expect(
      cacher.searchableEntries().map((entry) => entry.id),
      isNot(contains(quickAction.id)),
    );

    cacher.data!.includedShortcutIds.add(quickAction.id);
    expect(cacher.isShortcutIncluded(quickAction), isTrue);
    expect(
      cacher.searchableEntries().map((entry) => entry.id),
      contains(quickAction.id),
    );

    cacher.data!.hiddenShortcutIds.add(browserShortcut.id);
    expect(cacher.isShortcutIncluded(browserShortcut), isFalse);
    expect(
      cacher.searchableEntries().map((entry) => entry.id),
      isNot(contains(browserShortcut.id)),
    );
  });

  test('a temporary empty app refresh preserves the home-grid selection',
      () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    const channel = MethodChannel('nkit_launcher/launcher');
    final gridItem = GridApp('activity:com.example.app/Main:0');
    SharedPreferences.setMockInitialValues({
      'app_list_cache_v5': jsonEncode(CacheData([gridItem], {}).toJson()),
    });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'getEntries') {
        return <dynamic>[];
      }
      return null;
    });
    addTearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    final cacher = AppListCacher();
    await cacher.readCache();
    await cacher.updateCache();

    expect(cacher.data!.grid.single.entryId, gridItem.entryId);
  });
}
