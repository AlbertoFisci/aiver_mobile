import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:aiver_mobile/src/ui/screens/home/home_page.dart';
import 'package:aiver_mobile/src/ui/screens/options/options_page.dart';
import 'package:aiver_mobile/src/ui/screens/checklist/checklist_page.dart';
import 'package:aiver_mobile/src/ui/screens/incidenti/incidenti_page.dart';
import 'package:aiver_mobile/src/ui/screens/segnalazioni/segalazioni_page.dart';
import 'package:aiver_mobile/src/ui/screens/wizard_sessione/wizard_sessione_page.dart';
import 'package:aiver_mobile/src/router/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.options,
        name: AppRoutes.options,
        builder: (context, state) => const OptionsPage(),
      ),
      GoRoute(
        path: AppRoutes.checklist,
        name: AppRoutes.checklist,
        builder: (context, state) => const ChecklistPage(),
      ),
      GoRoute(
        path: AppRoutes.incidenti,
        name: AppRoutes.incidenti,
        builder: (context, state) => const IncidentiPage(),
      ),
      GoRoute(
        path: AppRoutes.segnalazioni,
        name: AppRoutes.segnalazioni,
        builder: (context, state) => const SegnalazioniPage(),
      ),
      GoRoute(
        path: AppRoutes.wizardSessione,
        name: AppRoutes.wizardSessione,
        builder: (context, state) => const WizardSessionePage(),
      ),
    ],
  );
}
