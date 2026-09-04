import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nkit_launcher/app_list.dart';
import 'package:nkit_launcher/launcher_bridge.dart';
import 'package:nkit_launcher/main.dart';
import 'package:provider/provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('nkit_launcher/launcher');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async => null);
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  Future<void> pumpLauncher(WidgetTester tester) async {
    final appList = AppListCacher()..data = CacheData([], {});
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: appList,
        child: const MyApp(),
      ),
    );
    await tester.pump();
  }

  testWidgets('Home atomically removes every modal route', (tester) async {
    await pumpLauncher(tester);

    await tester.tap(find.byTooltip('Options'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Launcher settings'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Theme mode'));
    await tester.pumpAndSettle();
    expect(find.byType(SimpleDialog), findsOneWidget);

    final reset = LauncherBridge.handleMethodCall(
      const MethodCall('homePressed'),
    );
    await tester.pump();
    await reset;
    await tester.pump();

    expect(find.byType(SimpleDialog), findsNothing);
    expect(find.text('Launcher settings'), findsNothing);
    expect(find.byType(IconAppGridWidget), findsOneWidget);
    expect(tester.hasRunningAnimations, isFalse);
  });

  testWidgets('Back clears search but never removes the Home root',
      (tester) async {
    await pumpLauncher(tester);

    await tester.tap(find.byType(TextField));
    await tester.enterText(find.byType(TextField), 'maps');
    expect(find.byType(AppListWidget), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pump();
    expect(find.byType(IconAppGridWidget), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pump();
    expect(find.byType(IconAppGridWidget), findsOneWidget);
  });
}
