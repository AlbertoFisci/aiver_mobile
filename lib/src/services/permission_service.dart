import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  /// Chiede tutti i permessi necessari al primo avvio
  static Future<void> requestInitialPermissions() async {
    await [
      Permission.camera,
      Permission.microphone,
      Permission.storage,
      Permission.photos,
      Permission.notification,
    ].request();
  }

  /// Controlla se tutti i permessi critici sono stati concessi
  static Future<bool> arePermissionsGranted() async {
    final camera = await Permission.camera.isGranted;
    final microphone = await Permission.microphone.isGranted;
    final storage = await Permission.storage.isGranted;
    final notification = await Permission.notification.isGranted;

    return camera && microphone && storage && notification;
  }

  /// Apre le impostazioni se il permesso è negato permanentemente
  static Future<void> openAppSettingsIfNeeded() async {
    final camera = await Permission.camera.status;
    if (camera.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
}
