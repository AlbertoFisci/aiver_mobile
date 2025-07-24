import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aiver_mobile/gen/l10n/app_localizations.dart';
import 'package:aiver_mobile/src/router/app_routes.dart';

class SharedDrawer extends StatelessWidget {
  const SharedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Profilo fittizio temporaneo (sostituibile con provider reale)
    final String userName = "Mario Rossi";
    final String userRole = "RSPP";

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Logo aziendale personalizzato (placeholder per ora)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/aiver_logo.png',
                height: 48,
              ),
            ),

            // 🔹 Dati profilo attivo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    l10n.drawer_user_role(userRole),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  TextButton(
                    onPressed: () {
                      // TODO: Implementa selezione profilo
                    },
                    child: Text(l10n.drawer_change_profile),
                  ),
                ],
              ),
            ),

            const Divider(),

            // 🔹 Voci di navigazione
            _DrawerLink(
              icon: Icons.home,
              label: l10n.menu_home,
              route: '/',
            ),
            _DrawerLink(
              icon: Icons.settings,
              label: l10n.menu_options,
              route: '/opzioni',
            ),
            _DrawerLink(
              icon: Icons.checklist,
              label: l10n.menu_checklist,
              route: '/checklist',
            ),
            _DrawerLink(
              icon: Icons.warning_amber,
              label: l10n.menu_incidenti,
              route: '/incidenti',
            ),
            _DrawerLink(
              icon: Icons.report,
              label: l10n.menu_segnalazioni,
              route: '/segnalazioni',
            ),

            const Spacer(),

            // 🔹 Pulsante verde per creazione sito/cantiere
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  context.go('/wizard_sito');
                },
                icon: const Icon(Icons.add_location_alt),
                label: Text(l10n.menu_crea_sito),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;

  const _DrawerLink({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        context.go(route);
      },
    );
  }
}
