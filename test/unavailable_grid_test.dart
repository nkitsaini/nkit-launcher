import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nkit_launcher/app_list.dart';
import 'package:nkit_launcher/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('nkit_launcher/launcher'),
            (call) async => null);
  });
  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('nkit_launcher/launcher'), null);
  });
  for (final arrange in [false, true]) {
    testWidgets(
        'missing tile can be removed from ${arrange ? 'Arrange' : 'Home'}',
        (tester) async {
      final cacher = AppListCacher()
        ..data = CacheData([GridApp('missing')], {});
      await tester.pumpWidget(
          ChangeNotifierProvider.value(value: cacher, child: const MyApp()));
      await tester.pumpAndSettle();
      if (arrange) {
        await tester.tap(find.byTooltip('Options'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Set up home'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Arrange'));
        await tester.pumpAndSettle();
      }
      await tester.tap(find.text('Unavailable').last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Remove from home'));
      await tester.pumpAndSettle();
      expect(cacher.data!.grid, isEmpty);
    });
  }
  testWidgets('missing tile can be replaced with a selected app',
      (tester) async {
    final app = LauncherEntry(
        id: 'example',
        title: 'Example',
        packageName: 'example',
        type: LauncherEntryType.activity);
    final cacher = AppListCacher()
      ..data = CacheData([GridApp('missing')], {app.id: app});
    await tester.pumpWidget(
        ChangeNotifierProvider.value(value: cacher, child: const MyApp()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Unavailable'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Replace'));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.widgetWithText(TextField, 'Replace with app or shortcut'),
        'Example');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Example').last);
    await tester.pumpAndSettle();
    expect(cacher.data!.grid.single.entryId, app.id);
    expect(find.text('Unavailable'), findsNothing);
  });
}
