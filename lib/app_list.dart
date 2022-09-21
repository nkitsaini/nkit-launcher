import 'package:device_apps/device_apps.dart';
import 'package:cache_manager/cache_manager.dart';
// import 'package:json_serializable/builder.dart';
import 'dart:convert';
// import 'package:json_serializable/json_serializable.dart';

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

class AppListCacher {
  String cacheKey = 'app_list_cache';
  List<App>? appList;

  Future readCache() async {
    dynamic value = await ReadCache.getString(key: cacheKey);
    if (value != null) {
      print("Reading from cache");
      appList = ((jsonDecode(value) as List)
          .map((x) => App.fromJson(x))
          .toList());
    } else {
      print("Cache read miss");
    }
  }

  Future<List<App>> getAppList() async {
    if (appList == null) {
      await readCache();
      updateCache();
    }
    if (appList == null) {
      await updateCache();
    }
    return appList!.map((e) => e).toList();
  }

  Future<List<Application>> _readApps() async {
    List<Application> apps = (await DeviceApps.getInstalledApplications(
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    ));
    return apps;
  }

  Future updateCache() async {
    print("updating cache");
    List<App> apps =
        (await _readApps()).map((x) => App.fromApplication(x)).toList();
    WriteCache.setString(
        key: cacheKey, value: jsonEncode(apps.map((x) => x.toJson()).toList()));
    print("cache updated");
    appList = apps;
  }
}
