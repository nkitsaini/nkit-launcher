import 'package:device_apps/device_apps.dart';
// import 'package:cache_manager/cache_manager.dart';
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

  readCache() {
    // ReadCache.getString(key: cacheKey).then((value) => {
    //       if (value != null)
    //         {
    //           appList = (jsonDecode(value) as List<Map<String, String>>)
    //               .map((x) => App.fromJson(x))
    //               .toList()
    //         }
    //     });
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
    List<App> apps =
        (await _readApps()).map((x) => App.fromApplication(x)).toList();
    // WriteCache.setString(
    //     key: cacheKey, value: jsonEncode(apps.map((x) => x.toJson()).toList()));
    appList = apps;
  }
}
