import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fuzzy_search.dart';
import 'launcher_bridge.dart';

enum LauncherEntryType { activity, shortcut }

class CacheData {
  List<GridApp> grid;
  Map<String, LauncherEntry> entries;

  CacheData(this.grid, this.entries);

  factory CacheData.fromJson(Map<String, dynamic> json) {
    final rawEntries = json['entries'] ?? json['apps'] ?? <String, dynamic>{};
    final entries = (rawEntries as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        key,
        LauncherEntry.fromJson(Map<String, dynamic>.from(value as Map)),
      ),
    );

    final grid = (json['grid'] as List? ?? const [])
        .map((item) => GridApp.fromJson(Map<String, dynamic>.from(item as Map)))
        .toList();

    return CacheData(grid, entries);
  }

  Map<String, dynamic> toJson() {
    return {
      'grid': grid.map((app) => app.toJson()).toList(),
      'entries': entries.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

class GridApp {
  String entryId;
  String? iconSlug;
  Map<String, dynamic>? icon;

  GridApp(this.entryId, {this.iconSlug, this.icon});

  factory GridApp.fromJson(Map<String, dynamic> json) {
    return GridApp(
      json['entryId'] as String? ?? json['packageName'] as String,
      iconSlug: json['iconSlug'] as String?,
      icon: json['icon'] == null
          ? null
          : Map<String, dynamic>.from(json['icon'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'entryId': entryId,
      'packageName': entryId,
      'iconSlug': iconSlug,
      'icon': icon,
    };
  }
}

class LauncherEntry {
  final String id;
  final String title;
  final String packageName;
  final String? activityName;
  final String? shortcutId;
  final int? userHash;
  final String? versionName;
  final LauncherEntryType type;

  /// Whether this entry is available before it is added to the home grid.
  /// Browser-created pinned shortcuts opt in so "Add to home screen" can add
  /// a search result without changing this launcher's grid.
  final bool searchableByDefault;

  LauncherEntry({
    required this.id,
    required this.title,
    required this.packageName,
    required this.type,
    this.activityName,
    this.shortcutId,
    this.userHash,
    this.versionName,
    this.searchableByDefault = false,
  });

  factory LauncherEntry.fromNative(Map<String, dynamic> json) {
    return LauncherEntry(
      id: json['id'] as String,
      title: json['title'] as String? ?? json['packageName'] as String,
      packageName: json['packageName'] as String,
      activityName: json['activityName'] as String?,
      shortcutId: json['shortcutId'] as String?,
      userHash: json['userHash'] as int?,
      versionName: json['versionName'] as String?,
      type: _typeFromString(json['type'] as String?),
      searchableByDefault: json['searchableByDefault'] as bool? ??
          _typeFromString(json['type'] as String?) ==
              LauncherEntryType.activity,
    );
  }

  factory LauncherEntry.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('appName')) {
      final packageName = json['packageName'] as String;
      return LauncherEntry(
        id: packageName,
        title: json['appName'] as String? ?? packageName,
        packageName: packageName,
        type: LauncherEntryType.activity,
        searchableByDefault: true,
      );
    }

    return LauncherEntry(
      id: json['id'] as String? ?? json['packageName'] as String,
      title: json['title'] as String? ??
          json['appName'] as String? ??
          json['packageName'] as String,
      packageName: json['packageName'] as String,
      activityName: json['activityName'] as String?,
      shortcutId: json['shortcutId'] as String?,
      userHash: json['userHash'] as int?,
      versionName: json['versionName'] as String?,
      type: _typeFromString(json['type'] as String?),
      searchableByDefault: json['searchableByDefault'] as bool? ??
          _typeFromString(json['type'] as String?) ==
              LauncherEntryType.activity,
    );
  }

  static LauncherEntryType _typeFromString(String? value) {
    return value == LauncherEntryType.shortcut.name
        ? LauncherEntryType.shortcut
        : LauncherEntryType.activity;
  }

  bool matches(String filter) {
    return searchMatch(filter) != null;
  }

  LauncherEntrySearchMatch? searchMatch(String query) {
    final titleMatch = FuzzySearch.match(query, title);
    final packageMatch = FuzzySearch.match(query, packageName);
    if (titleMatch == null && packageMatch == null) {
      return null;
    }

    // A title is what people see and type first. Keep a title hit ahead of a
    // package-only hit, but still allow package names to discover an app.
    final score = (titleMatch?.score ?? packageMatch!.score) +
        (titleMatch == null ? 0 : 1000);
    return LauncherEntrySearchMatch(
      entry: this,
      score: score,
      titleMatch: titleMatch,
      packageMatch: packageMatch,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'packageName': packageName,
      'activityName': activityName,
      'shortcutId': shortcutId,
      'userHash': userHash,
      'versionName': versionName,
      'type': type.name,
      'searchableByDefault': searchableByDefault,
    };
  }
}

class LauncherEntrySearchMatch {
  const LauncherEntrySearchMatch({
    required this.entry,
    required this.score,
    this.titleMatch,
    this.packageMatch,
  });

  final LauncherEntry entry;
  final int score;
  final FuzzyMatch? titleMatch;
  final FuzzyMatch? packageMatch;
}

class WallpaperAppearance {
  final String path;
  final double cropScale;
  final double cropX;
  final double cropY;
  final bool frosted;
  final double frostBlur;
  final double frostOpacity;
  final double frostTint;

  const WallpaperAppearance({
    required this.path,
    this.cropScale = 1,
    this.cropX = 0,
    this.cropY = 0,
    this.frosted = false,
    this.frostBlur = 12,
    this.frostOpacity = 0.32,
    this.frostTint = 0.92,
  });

  factory WallpaperAppearance.fromJson(Map<String, dynamic> json) {
    return WallpaperAppearance(
      path: json['path'] as String,
      cropScale: LauncherSettings._boundedSetting(
        json['cropScale'],
        1,
        1,
        3,
      ),
      cropX: LauncherSettings._boundedSetting(json['cropX'], 0, -1, 1),
      cropY: LauncherSettings._boundedSetting(json['cropY'], 0, -1, 1),
      frosted: json['frosted'] as bool? ?? false,
      frostBlur: LauncherSettings._boundedSetting(
        json['frostBlur'],
        12,
        0,
        30,
      ),
      frostOpacity: LauncherSettings._boundedSetting(
        json['frostOpacity'],
        0.32,
        0,
        0.8,
      ),
      frostTint: LauncherSettings._boundedSetting(
        json['frostTint'],
        0.92,
        0,
        1,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'cropScale': cropScale,
      'cropX': cropX,
      'cropY': cropY,
      'frosted': frosted,
      'frostBlur': frostBlur,
      'frostOpacity': frostOpacity,
      'frostTint': frostTint,
    };
  }
}

class LauncherSettings {
  final ThemeMode themeMode;
  final WallpaperAppearance? lightWallpaper;
  final WallpaperAppearance? darkWallpaper;
  final int homeColumns;
  final bool frostedIconBackgrounds;
  final double frostBlur;
  final double frostOpacity;
  final double iconBackgroundRadius;
  final double iconBackgroundPadding;

  const LauncherSettings({
    this.themeMode = ThemeMode.system,
    this.lightWallpaper,
    this.darkWallpaper,
    this.homeColumns = 2,
    this.frostedIconBackgrounds = false,
    this.frostBlur = 12,
    this.frostOpacity = 0.56,
    this.iconBackgroundRadius = 14,
    this.iconBackgroundPadding = 8,
  });

  factory LauncherSettings.fromJson(Map<String, dynamic> json) {
    return LauncherSettings(
      themeMode: ThemeMode.values.firstWhere(
        (mode) => mode.name == json['themeMode'],
        orElse: () => ThemeMode.system,
      ),
      lightWallpaper: _wallpaperFromJson(
        json['lightWallpaper'],
        json['lightWallpaperPath'] as String?,
      ),
      darkWallpaper: _wallpaperFromJson(
        json['darkWallpaper'],
        json['darkWallpaperPath'] as String?,
      ),
      homeColumns: _boundedIntSetting(json['homeColumns'], 2, 1, 5),
      frostedIconBackgrounds: json['frostedIconBackgrounds'] as bool? ?? false,
      // iconFrost* was the original, icon-only setting. Keep reading it so
      // existing launcher installs retain their chosen appearance.
      frostBlur: _boundedSetting(
        json['frostBlur'] ?? json['iconFrostBlur'],
        12,
        0,
        30,
      ),
      frostOpacity: _boundedSetting(
        json['frostOpacity'] ?? json['iconFrostOpacity'],
        0.56,
        0.05,
        0.9,
      ),
      iconBackgroundRadius:
          _boundedSetting(json['iconBackgroundRadius'], 14, 0, 32),
      iconBackgroundPadding:
          _boundedSetting(json['iconBackgroundPadding'], 8, 0, 24),
    );
  }

  static double _boundedSetting(
    dynamic value,
    double fallback,
    double minimum,
    double maximum,
  ) {
    final number = value is num ? value.toDouble() : fallback;
    return number.clamp(minimum, maximum);
  }

  static WallpaperAppearance? _wallpaperFromJson(
    dynamic value,
    String? legacyPath,
  ) {
    if (value is Map) {
      final json = Map<String, dynamic>.from(value);
      if (json['path'] is String) {
        return WallpaperAppearance.fromJson(json);
      }
    }
    return legacyPath == null ? null : WallpaperAppearance(path: legacyPath);
  }

  String? get lightWallpaperPath => lightWallpaper?.path;
  String? get darkWallpaperPath => darkWallpaper?.path;

  static int _boundedIntSetting(
    dynamic value,
    int fallback,
    int minimum,
    int maximum,
  ) {
    final number = value is num ? value.toInt() : fallback;
    return number.clamp(minimum, maximum);
  }

  LauncherSettings copyWith({
    ThemeMode? themeMode,
    WallpaperAppearance? lightWallpaper,
    WallpaperAppearance? darkWallpaper,
    bool clearLightWallpaper = false,
    bool clearDarkWallpaper = false,
    int? homeColumns,
    bool? frostedIconBackgrounds,
    double? frostBlur,
    double? frostOpacity,
    double? iconBackgroundRadius,
    double? iconBackgroundPadding,
  }) {
    return LauncherSettings(
      themeMode: themeMode ?? this.themeMode,
      lightWallpaper:
          clearLightWallpaper ? null : lightWallpaper ?? this.lightWallpaper,
      darkWallpaper:
          clearDarkWallpaper ? null : darkWallpaper ?? this.darkWallpaper,
      homeColumns: homeColumns ?? this.homeColumns,
      frostedIconBackgrounds:
          frostedIconBackgrounds ?? this.frostedIconBackgrounds,
      frostBlur: frostBlur ?? this.frostBlur,
      frostOpacity: frostOpacity ?? this.frostOpacity,
      iconBackgroundRadius: iconBackgroundRadius ?? this.iconBackgroundRadius,
      iconBackgroundPadding:
          iconBackgroundPadding ?? this.iconBackgroundPadding,
    );
  }

  WallpaperAppearance? wallpaperFor(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return darkWallpaper ?? lightWallpaper;
    }
    return lightWallpaper ?? darkWallpaper;
  }

  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.name,
      // Keep paths for installs on an older app version, while the complete
      // appearance data is used by the current version.
      'lightWallpaperPath': lightWallpaperPath,
      'darkWallpaperPath': darkWallpaperPath,
      'lightWallpaper': lightWallpaper?.toJson(),
      'darkWallpaper': darkWallpaper?.toJson(),
      'homeColumns': homeColumns,
      'frostedIconBackgrounds': frostedIconBackgrounds,
      'frostBlur': frostBlur,
      'frostOpacity': frostOpacity,
      'iconBackgroundRadius': iconBackgroundRadius,
      'iconBackgroundPadding': iconBackgroundPadding,
    };
  }
}

class AppListCacher extends ChangeNotifier {
  static const String _cacheKey = 'app_list_cache_v5';
  static const String _legacyCacheKey = 'app_list_cache_v4';
  static const String _settingsKey = 'launcher_settings_v1';

  CacheData? data;
  LauncherSettings settings = const LauncherSettings();
  StreamSubscription<void>? _appChangeSubscription;

  Future<void> initialize() async {
    LauncherBridge.setEntriesChangedHandler(updateCache);
    await readSettings();
    await getAppList();
    _appChangeSubscription ??= LauncherBridge.appChanges.listen((_) {
      updateCache();
    });
  }

  Future<void> readSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_settingsKey);
    if (value == null) {
      return;
    }
    settings = LauncherSettings.fromJson(jsonDecode(value));
    notifyListeners();
  }

  Future<void> updateSettings(LauncherSettings nextSettings) async {
    settings = nextSettings;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, jsonEncode(settings.toJson()));
    notifyListeners();
  }

  Future<void> readCache() async {
    final prefs = await SharedPreferences.getInstance();
    final value =
        prefs.getString(_cacheKey) ?? prefs.getString(_legacyCacheKey);
    if (value == null) {
      return;
    }
    data = CacheData.fromJson(jsonDecode(value));
    notifyListeners();
  }

  Future<Map<String, LauncherEntry>> getAppList() async {
    if (data == null) {
      await readCache();
    }
    if (data == null) {
      await updateCache();
    } else {
      unawaited(updateCache());
    }

    return data!.entries;
  }

  Future<void> updateCache() async {
    final nativeEntries = await LauncherBridge.getLauncherEntries();
    final entries = <String, LauncherEntry>{};
    for (final nativeEntry in nativeEntries) {
      final entry = LauncherEntry.fromNative(nativeEntry);
      entries[entry.id] = entry;
    }

    if (data == null) {
      data = CacheData([], entries);
    } else {
      data!.entries = entries;
      _migrateLegacyGridIds();
      _removeMissingGridEntries();
    }
    await flushChanges();
  }

  Future<void> flushChanges() async {
    assert(data != null);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cacheKey, jsonEncode(data!.toJson()));
    notifyListeners();
  }

  Future<void> setGridCache(List<GridApp> apps) async {
    if (data == null) {
      await updateCache();
    }
    data!.grid = apps;
    _migrateLegacyGridIds();
    _removeMissingGridEntries();
    await flushChanges();
  }

  Future<void> addToGrid(LauncherEntry entry) async {
    if (data == null) {
      await updateCache();
    }
    final exists = data!.grid.any((item) => item.entryId == entry.id);
    if (!exists) {
      data!.grid.add(GridApp(entry.id));
      await flushChanges();
    }
  }

  Future<void> removeFromGrid(String entryId) async {
    if (data == null) {
      return;
    }
    data!.grid.removeWhere((item) => item.entryId == entryId);
    await flushChanges();
  }

  Future<void> moveGridItem(int oldIndex, int newIndex) async {
    if (data == null) {
      return;
    }
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = data!.grid.removeAt(oldIndex);
    data!.grid.insert(newIndex, item);
    await flushChanges();
  }

  Future<void> moveGridItemToIndex(int oldIndex, int newIndex) async {
    if (moveGridItemToIndexLive(oldIndex, newIndex)) {
      await flushChanges();
    }
  }

  bool moveGridItemToIndexLive(int oldIndex, int newIndex) {
    if (data == null) {
      return false;
    }
    if (oldIndex < 0 ||
        newIndex < 0 ||
        oldIndex >= data!.grid.length ||
        newIndex >= data!.grid.length ||
        oldIndex == newIndex) {
      return false;
    }
    final item = data!.grid.removeAt(oldIndex);
    data!.grid.insert(newIndex, item);
    notifyListeners();
    return true;
  }

  LauncherEntry? entryFor(GridApp gridApp) {
    return data?.entries[gridApp.entryId] ??
        _entryForLegacyPackage(gridApp.entryId);
  }

  List<LauncherEntry> sortedEntries() {
    final entries = data?.entries.values.toList() ?? <LauncherEntry>[];
    entries.sort(
      (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
    );
    return entries;
  }

  /// Apps are always searchable. Most shortcuts become searchable only after
  /// they have been added to the home grid; browser-created pinned shortcuts
  /// opt in so Android's "Add to home screen" does not alter the grid.
  List<LauncherEntry> searchableEntries() {
    final homeEntryIds = data?.grid.map((item) => item.entryId).toSet() ?? {};
    return sortedEntries()
        .where(
          (entry) =>
              entry.searchableByDefault || homeEntryIds.contains(entry.id),
        )
        .toList(growable: false);
  }

  List<LauncherEntrySearchMatch> searchEntries(String query) {
    final matches = searchableEntries()
        .map((entry) => entry.searchMatch(query))
        .whereType<LauncherEntrySearchMatch>()
        .toList();
    matches.sort((a, b) {
      final scoreComparison = b.score.compareTo(a.score);
      if (scoreComparison != 0) {
        return scoreComparison;
      }
      return a.entry.title.toLowerCase().compareTo(b.entry.title.toLowerCase());
    });
    return matches;
  }

  void _migrateLegacyGridIds() {
    if (data == null) {
      return;
    }
    for (final item in data!.grid) {
      if (data!.entries.containsKey(item.entryId)) {
        continue;
      }
      final entry = _entryForLegacyPackage(item.entryId);
      if (entry != null) {
        item.entryId = entry.id;
      }
    }
  }

  void _removeMissingGridEntries() {
    data!.grid.removeWhere((item) => !data!.entries.containsKey(item.entryId));
  }

  LauncherEntry? _entryForLegacyPackage(String packageName) {
    for (final entry in data?.entries.values ?? <LauncherEntry>[]) {
      if (entry.packageName == packageName &&
          entry.type == LauncherEntryType.activity) {
        return entry;
      }
    }
    return null;
  }

  @override
  void dispose() {
    _appChangeSubscription?.cancel();
    super.dispose();
  }
}
