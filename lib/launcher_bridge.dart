import 'dart:async';
import 'package:flutter/services.dart';

class LauncherBridge {
  static const MethodChannel _methods = MethodChannel('nkit_launcher/launcher');
  static const EventChannel _events =
      EventChannel('nkit_launcher/apps_changed');

  static Future<void> Function()? _onHomePressed;

  /// Registers the callback invoked when Android routes a Home-button press to
  /// this launcher activity.
  static void setHomePressedHandler(Future<void> Function()? handler) {
    _onHomePressed = handler;
    _methods.setMethodCallHandler(handler == null ? null : handleMethodCall);
  }

  static Future<void> handleMethodCall(MethodCall call) async {
    if (call.method == 'homePressed') {
      await _onHomePressed?.call();
    }
  }

  static Future<List<Map<String, dynamic>>> getLauncherEntries() async {
    final result = await _methods.invokeListMethod<dynamic>('getEntries');
    return (result ?? const [])
        .map((entry) => Map<String, dynamic>.from(entry as Map))
        .toList();
  }

  static Future<void> openEntry(Map<String, dynamic> entry) {
    return _methods.invokeMethod<void>('openEntry', entry);
  }

  static Future<void> openAppSettings(String packageName) {
    return _methods.invokeMethod<void>(
      'openAppSettings',
      {'packageName': packageName},
    );
  }

  static Future<void> uninstallPackage(String packageName) {
    return _methods.invokeMethod<void>(
      'uninstallPackage',
      {'packageName': packageName},
    );
  }

  static Future<Uint8List?> getEntryIcon(Map<String, dynamic> entry) {
    return _methods.invokeMethod<Uint8List>('getEntryIcon', entry);
  }

  static Future<String?> pickFile({String mimeType = '*/*'}) {
    return _methods.invokeMethod<String>('pickFile', {'mimeType': mimeType});
  }

  static Future<bool> saveTextFile({
    required String fileName,
    required String content,
    String mimeType = 'application/json',
  }) async {
    return await _methods.invokeMethod<bool>('saveTextFile', {
          'fileName': fileName,
          'content': content,
          'mimeType': mimeType,
        }) ??
        false;
  }

  static Stream<void> get appChanges {
    return _events.receiveBroadcastStream().map((_) {});
  }
}
