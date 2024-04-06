import 'package:device_apps/device_apps.dart';
import 'package:cache_manager/cache_manager.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

class CacheData {
  List<GridApp> grid;
  Map<String, App> apps;

  CacheData(this.grid, this.apps);

  factory CacheData.fromJson(Map<String, dynamic> json) {
    var apps = (json['apps'] as Map<String, dynamic>)
        .map((x, y) => MapEntry(x, App.fromJson(y)));

    List<GridApp> grid =
        (json['grid'] as List).map((x) => gridAppFromJson(x)).toList();

    return CacheData(grid, apps);
  }

  static gridAppToJson(GridApp gridApp) {
    return gridApp.toJson();
  }

  static GridApp gridAppFromJson(Map<String, dynamic> json) {
    return GridApp.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'grid': grid.map((x) => gridAppToJson(x)).toList(),
      'apps': apps.map((x, y) => MapEntry(x, y.toJson()))
    };
  }
}

class GridApp {
  final String packageName;
  String? iconSlug;

  GridApp(this.packageName, this.iconSlug);

  factory GridApp.fromJson(Map<String, dynamic> json) {
    return GridApp(json['packageName'], json['iconSlug']);
  }

  Map<String, dynamic> toJson() {
    return {'packageName': packageName, 'iconSlug': iconSlug};
  }
}

class App {
  final String appName, packageName;

  App(this.appName, this.packageName);

  factory App.fromJson(Map<String, dynamic> json) =>
      App(json['appName'], json['packageName']);

  factory App.fromApplication(Application application) =>
      App(application.appName, application.packageName);

  Map<String, dynamic> toJson() {
    return {'appName': appName, 'packageName': packageName};
  }
}

class AppListCacher extends ChangeNotifier {
  String cacheKey = 'app_list_cache_v4';
  CacheData? data;

  Future readCache() async {
    dynamic value = await ReadCache.getString(key: cacheKey);
    if (value != null) {
      print("Reading from cache");
      data = CacheData.fromJson(jsonDecode(value));
      notifyListeners();
    } else {
      print("Cache read miss");
    }
  }

  Future<Map<String, App>> getAppList() async {
    if (data == null) {
      await readCache();
    }
    // Do ~blocking get if there was nothing in cache
    if (data == null) {
      await updateCache();
    } else {
      updateCache();
    }

    return data!.apps;
  }

  Future<List<Application>> _readApps() async {
    List<Application> apps = (await DeviceApps.getInstalledApplications(
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    ));
    return apps;
  }

  flushChanges() {
    assert(data != null);
    WriteCache.setString(key: cacheKey, value: jsonEncode(data!.toJson()));
    print("cache updated");
    notifyListeners();
  }

  setGridCache(List<GridApp> apps) async {
    if (data == null) {
      await updateCache();
    }
    data!.grid = apps;
    flushChanges();
  }

  Future updateCache() async {
    List<App> appList = (await _readApps())
        .where((x) => x.enabled)
        .map((x) => App.fromApplication(x))
        .toList();
    Map<String, App> apps = {};
    for (final app in appList) {
      apps[app.packageName] = app;
    }
    if (data == null) {
      data = CacheData([], apps);
    } else {
      data!.apps = apps;
    }
    flushChanges();
  }
}
