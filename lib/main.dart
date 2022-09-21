import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:cache_manager/cache_manager.dart';
import 'package:nkit_launcher/app_list.dart';

AppListCacher appList = AppListCacher();

void main() {
  runApp(const MyApp());
}

class AppListWidget extends StatefulWidget {
  const AppListWidget({Key? key, required this.filterKey}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String filterKey;

  @override
  State<AppListWidget> createState() => AppListState();
}

class AppListState extends State<AppListWidget> {
  Widget projectWidget() {
    return FutureBuilder(
      initialData: <Application>[],
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Text('connection none');
        }

        if (projectSnap.data == null) {
          return Text('data null');
        }

        List<Application> apps = projectSnap.data as List<Application>;

        bool isFiltered = widget.filterKey != '';
        apps.sort(
          (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()),
        );
        if (isFiltered) {
          apps = apps.reversed.toList();
        }
        apps.removeWhere((app) => !app.appName
            .toLowerCase()
            .contains(widget.filterKey.toLowerCase()));
        print('App length: ${apps.length}');
        return ListView.builder(
          reverse: isFiltered,
          itemCount: apps.length,
          itemBuilder: (context, index) {
            Application app = apps[index];
            return GestureDetector(
                child: ListTile(
                  title:
                      Text(app.appName, style: const TextStyle(fontSize: 18.0)),
                ),
                onTap: () => {DeviceApps.openApp(app.packageName)});
          },
        );
      },
      future: appList.getAppList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: projectWidget(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  String filterSearch = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: AppListWidget(
            filterKey: filterSearch,
          ),
        ),
        TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            contentPadding: EdgeInsets.all(8.0),
            hintText: 'Search',
          ),
          onChanged: (value) => {
            setState(() => {filterSearch = value})
          },
        ),
      ],
    ));
  }
}
