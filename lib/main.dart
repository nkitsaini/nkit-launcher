import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:nkit_launcher/app_icon.dart';
import 'package:provider/provider.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import 'app_list.dart';

// AppListCacher appList = AppListCacher();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nkit Launcher',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        brightness: Brightness.light,
        // brightness:
        //     SchedulerBinding.instance.platformDispatcher.platformBrightness,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Nkit Launcher Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? filterSearch;
  TextEditingController textController = TextEditingController();
  UnfocusDisposition disposition = UnfocusDisposition.scope;

  @override
  Widget build(BuildContext context) {
    unfocusTextField() {
      textController.clear();
      primaryFocus!.unfocus(disposition: disposition);
      setState(() {
        filterSearch = null;
      });
    }

    List<Widget> children = [];
    if (filterSearch == null) {
      children.add(const Expanded(child: IconAppGridWidget()));
    } else {
      children.add(Expanded(
        child: AppListWidget(
          filterKey: filterSearch,
          onAppOpen: () {
            unfocusTextField();
          },
        ),
      ));
      children.add(IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          unfocusTextField();
        },
      ));
    }

    children.add(Row(
      children: [
        Expanded(
          child: Consumer<AppListCacher>(builder: (context, appList, child) {
            int appCount = 0;
            if (appList.data != null) {
              appCount = appList.data!.apps.length;
            }

            return TextField(
              controller: textController,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                contentPadding: const EdgeInsets.all(8.0),
                hintText: 'Search $appCount apps',
              ),
              onChanged: (value) => {
                setState(() {
                  filterSearch = value;
                })
              },
              onTap: () {
                setState(() {
                  filterSearch = '';
                });
              },
              autocorrect: false,
              autofocus: false,
              // focusNode: messageFocus,
            );
          }),
        ),
        Consumer<AppListCacher>(builder: (context, appList, child) {
          return IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: "Options",
            onPressed: () async {
              GlobalAction? action = await askGlobalAction(context);
              switch (action) {
                case GlobalAction.refreshApps:
                  await appList.updateCache();
                case null:
              }
            },
          );
        })
      ],
    ));

    return Scaffold(
        body: ChangeNotifierProvider(
            create: (context) {
              AppListCacher cacher = AppListCacher();
              cacher.getAppList(); // TODO: handle error
              return cacher;
            },
            child: Column(
              children: children,
            )));
  }
}

class AppListWidget extends StatefulWidget {
  const AppListWidget(
      {super.key, required this.filterKey, required this.onAppOpen});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? filterKey;
  final Function() onAppOpen;

  @override
  State<AppListWidget> createState() => AppListState();
}

class IconAppGridWidget extends StatelessWidget {
  const IconAppGridWidget({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppListCacher>(builder: (context, appList, child) {
      if (appList.data == null) {
        return const Row(children: []);
      }

      longPressActionHandler(int index) async {
        GridIconAction? action = await askGridIconAction(
            context, appList.data!.grid[index].app.appName);
        switch (action) {
          case GridIconAction.selectIcon:
            IconData? icon =
                await showIconPicker(context, customIconPack: icons);
            if (icon != null) {
              appList.data!.grid[index].iconSlug = iconDataToName(icon);
            }
            appList.flushChanges();
          case GridIconAction.remove:
            appList.data!.grid.removeAt(index);
            appList.flushChanges();
          case GridIconAction.moveToLeft:
            if (index != 0) {
              GridApp app = appList.data!.grid.removeAt(index);
              appList.data!.grid.insert(index - 1, app);
              appList.flushChanges();
            }
          case GridIconAction.moveToRight:
            if (index != appList.data!.grid.length - 1) {
              GridApp app = appList.data!.grid.removeAt(index);
              appList.data!.grid.insert(index + 1, app);
              appList.flushChanges();
            }
          case null:
        }
      }

      List<GridApp> apps = appList.data!.grid;

      List<Widget> children = [];
      const iconSize = 48.0;
      for (final (index, app) in apps.indexed) {
        IconButton button;
        Widget icon;
        if (app.iconSlug == null) {
          icon = const Icon(Icons.bolt, size: iconSize);
        } else {
          icon = Icon(icons[app.iconSlug!], size: iconSize);
        }
        button = IconButton(
          icon: icon,
          onPressed: () {
            DeviceApps.openApp(app.app.packageName);
          },
        );

        children.add(GestureDetector(
            child: button,
            onLongPress: () {
              longPressActionHandler(index);
            }));
      }
      return GridView.count(
        crossAxisCount: 2,
        children: children,
      );
    });
  }
}
// class AppListState extends State<AppListWidget> {
//   Widget projectWidget() {
//     // messageFocus.requestFocus();
//     return FutureBuilder(
//       initialData: const <App>[],
//       builder: (context, projectSnap) {
//         // messageFocus.requestFocus();
//         if (projectSnap.connectionState == ConnectionState.none &&
//             projectSnap.hasData == false) {
//           return const Text('connection none');
//         }

//         if (projectSnap.data == null) {
//           return const Text('data null');
//         }

//         List<App> apps = projectSnap.data as List<App>;

//         bool isFiltered = widget.filterKey != '';
//         apps.sort(
//           (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()),
//         );
//         if (isFiltered) {
//           apps = apps.reversed.toList();
//         }
//         apps.removeWhere((app) => !app.appName
//             .toLowerCase()
//             .contains(widget.filterKey.toLowerCase()));
//         print('App length: ${apps.length}');
//         return ListView.builder(
//           reverse: isFiltered,
//           itemCount: apps.length,
//           itemBuilder: (context, index) {
//             App app = apps[index];
//             return GestureDetector(
//               child: ListTile(
//                 title:
//                     Text(app.appName, style: const TextStyle(fontSize: 18.0)),
//               ),
//               onTap: () => {DeviceApps.openApp(app.packageName)},
//               onLongPress: () {
//                 AndroidIntent intent = AndroidIntent(
//                   action: 'action_application_details_settings',
//                   data: 'package:${app.packageName}',
//                   flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
//                 );
//                 intent.launch();
//               },
//             );
//           },
//         );
//       },
//       future: appList.getAppList(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: projectWidget(),
//     );
//   }
// }

enum GridIconAction { selectIcon, moveToLeft, moveToRight, remove }

Future<GridIconAction?> askGridIconAction(
    BuildContext context, String title) async {
  return await showDialog<GridIconAction>(
      context: context,
      builder: (BuildContext context) {
        List<Widget> children = [
          SimpleDialogOption(
              onPressed: () =>
                  Navigator.pop(context, GridIconAction.selectIcon),
              child: const Text('Select Icon')),
          SimpleDialogOption(
              onPressed: () => Navigator.pop(context, GridIconAction.remove),
              child: const Text('Remove')),
          SimpleDialogOption(
              onPressed: () =>
                  Navigator.pop(context, GridIconAction.moveToLeft),
              child: const Text('Move to Left')),
          SimpleDialogOption(
              onPressed: () =>
                  Navigator.pop(context, GridIconAction.moveToRight),
              child: const Text('Move to Right')),
        ];
        return SimpleDialog(
          title: Text(title),
          children: children,
        );
      });
}

enum GlobalAction { refreshApps }

Future<GlobalAction?> askGlobalAction(BuildContext context) async {
  return await showDialog<GlobalAction>(
      context: context,
      builder: (BuildContext context) {
        List<Widget> children = [
          SimpleDialogOption(
              onPressed: () => Navigator.pop(context, GlobalAction.refreshApps),
              child: const Text('Refresh Apps')),
        ];
        return SimpleDialog(children: children);
      });
}

enum AppAction { addToGrid, openAppSettings }

Future<AppAction?> askAppActions(BuildContext context) async {
  return await showDialog<AppAction>(
      context: context,
      builder: (BuildContext context) {
        List<Widget> children = [
          SimpleDialogOption(
              onPressed: () => Navigator.pop(context, AppAction.addToGrid),
              child: const Text('Add To Grid')),
          SimpleDialogOption(
              onPressed: () =>
                  Navigator.pop(context, AppAction.openAppSettings),
              child: const Text('Open App Setting')),
        ];
        return SimpleDialog(children: children);
      });
}

class AppListState extends State<AppListWidget> {
  Widget projectWidget() {
    return Consumer<AppListCacher>(
      builder: (context, appList, child) {
        // messageFocus.requestFocus();
        if (appList.data == null) {
          // This is very very short lived
          return const Text(
            'loading ...',
            style: TextStyle(fontSize: 32),
          );
        }

        List<App> apps = appList.data!.apps.toList();
        if (widget.filterKey == null) {
          return const Row();
        }

        String filterKey = widget.filterKey!;

        bool isFiltered = filterKey != '';
        apps.sort(
          (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()),
        );

        apps.removeWhere((app) =>
            !app.appName.toLowerCase().contains(filterKey.toLowerCase()));
        print('App length: ${apps.length}');
        return ListView.builder(
          reverse: isFiltered,
          itemCount: apps.length,
          itemBuilder: (context, index) {
            App app = apps[index];
            return GestureDetector(
              child: ListTile(
                title:
                    Text(app.appName, style: const TextStyle(fontSize: 18.0)),
              ),
              onTap: () {
                DeviceApps.openApp(app.packageName);
                widget.onAppOpen();
              },
              onLongPress: () async {
                AppAction? action = await askAppActions(context);
                switch (action) {
                  case AppAction.openAppSettings:
                    AndroidIntent intent = AndroidIntent(
                      action: 'action_application_details_settings',
                      data: 'package:${app.packageName}',
                      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
                    );
                    intent.launch();
                  case AppAction.addToGrid:
                    appList.data!.grid.add(GridApp(app, null));
                    await appList.flushChanges();
                  case null:
                }
              },
            );
          },
        );
      },
    );
    // messageFocus.requestFocus();
    // return FutureBuilder(
    //   initialData: const <App>[],
    //   builder: (context, projectSnap) {
    //     // messageFocus.requestFocus();
    //     if (projectSnap.connectionState == ConnectionState.none &&
    //         projectSnap.hasData == false) {
    //       return const Text('connection none');
    //     }

    //     if (projectSnap.data == null) {
    //       return const Text('data null');
    //     }

    //     List<App> apps = projectSnap.data as List<App>;

    //     bool isFiltered = widget.filterKey != '';
    //     apps.sort(
    //       (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()),
    //     );
    //     if (isFiltered) {
    //       apps = apps.reversed.toList();
    //     }
    //     apps.removeWhere((app) => !app.appName
    //         .toLowerCase()
    //         .contains(widget.filterKey.toLowerCase()));
    //     print('App length: ${apps.length}');
    //     return ListView.builder(
    //       reverse: isFiltered,
    //       itemCount: apps.length,
    //       itemBuilder: (context, index) {
    //         App app = apps[index];
    //         return GestureDetector(
    //           child: ListTile(
    //             title:
    //                 Text(app.appName, style: const TextStyle(fontSize: 18.0)),
    //           ),
    //           onTap: () => {DeviceApps.openApp(app.packageName)},
    //           onLongPress: () {
    //             AndroidIntent intent = AndroidIntent(
    //               action: 'action_application_details_settings',
    //               data: 'package:${app.packageName}',
    //               flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    //             );
    //             intent.launch();
    //           },
    //         );
    //       },
    //     );
    //   },
    //   future: appList.getAppList(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: projectWidget(),
    );
  }
}
