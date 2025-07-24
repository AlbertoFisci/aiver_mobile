import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'src/app.dart';

import 'package:aiver_mobile/src/providers/sector_subsector_provider.dart'; // Importa il provider
import 'package:aiver_mobile/src/ui/screens/checklist/checklist_page.dart'; // Importa la pagina

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ Controlla se è la prima apertura
  final prefs = await SharedPreferences.getInstance();
  final isFirstOpen = prefs.getBool('first_open_done') ?? false;

  runApp(AiVerApp(showPermissions: !isFirstOpen));
}