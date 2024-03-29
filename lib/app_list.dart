import 'package:device_apps/device_apps.dart';
import 'package:cache_manager/cache_manager.dart';
// import 'package:json_serializable/builder.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:json_serializable/json_serializable.dart';

class CacheData {
  final List<GridApp> grid;
  List<App> apps;

  CacheData(this.grid, this.apps);

  factory CacheData.fromJson(Map<String, dynamic> json) => CacheData(
      (json['grid'] as List).map((x) => gridAppFromJson(x)).toList(),
      (json['apps'] as List).map((x) => App.fromJson(x)).toList());

  static gridAppToJson(GridApp gridApp) {
    return gridApp.toJson();
  }

  static GridApp gridAppFromJson(Map<String, dynamic> json) {
    return GridApp.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'grid': grid.map((x) => gridAppToJson(x)).toList(),
      'apps': apps.map((x) => x.toJson()).toList()
    };
  }
}

class GridApp {
  final App app;
  String? iconSlug;

  GridApp(this.app, this.iconSlug);

  factory GridApp.fromJson(Map<String, dynamic> json) {
    return GridApp(App.fromJson(json['app']), json['iconSlug']);
  }

  Map<String, dynamic> toJson() {
    return {'app': app.toJson(), 'iconSlug': iconSlug};
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

  Future<List<App>> getAppList() async {
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

  Future updateCache() async {
    print("updating cache");
    List<App> apps = (await _readApps())
        .where((x) => x.enabled)
        .map((x) => App.fromApplication(x))
        .toList();
    if (data == null) {
      data = CacheData([], apps);
    } else {
      data!.apps = apps;
    }
    flushChanges();
  }
}
