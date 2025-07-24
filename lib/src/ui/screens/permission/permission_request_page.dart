import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

import 'package:aiver_mobile/src/router/app_routes.dart';

class PermissionRequestPage extends StatefulWidget {
  const PermissionRequestPage({super.key});

  @override
  State<PermissionRequestPage> createState() => _PermissionRequestPageState();
}

class _PermissionRequestPageState extends State<PermissionRequestPage> {
  bool _isRequesting = false;

  Future<void> _requestPermissions() async {
    setState(() => _isRequesting = true);

    final Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Permission.storage,
      Permission.photos,
      Permission.notification,
    ].request();

    final allGranted = statuses.values.every((status) => status.isGranted);

    if (allGranted) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('first_open_done', true);

      // Naviga direttamente alla home sostituendo la pagina attuale
      if (!mounted) return;
      context.go(AppRoutes.home);
    } else {
      setState(() => _isRequesting = false);
      _showSettingsDialog();
    }
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Permessi necessari"),
        content: const Text(
            "Per usare tutte le funzionalità di AiVer, concedi i permessi dalle impostazioni del dispositivo."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Annulla"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await openAppSettings();
            },
            child: const Text("Apri impostazioni"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.privacy_tip, size: 80),
              const SizedBox(height: 24),
              const Text(
                "AiVer richiede alcuni permessi per funzionare correttamente.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _isRequesting ? null : _requestPermissions,
                icon: const Icon(Icons.check),
                label: Text(_isRequesting
                    ? "Controllo in corso..."
                    : "Concedi permessi"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
