import 'package:flutter/material.dart';
import 'package:aiver_mobile/src/ui/components/shared_appbar.dart';
import 'package:aiver_mobile/src/ui/components/shared_drawer.dart';
import 'package:aiver_mobile/gen/l10n/app_localizations.dart';


class SegnalazioniPage extends StatelessWidget {
  const SegnalazioniPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: SharedAppBar(title: l10n.menu_segnalazioni),
      drawer: const SharedDrawer(),
      body: const Center(
        child: Text('Pagina Segnalazioni / Rapporti - Placeholder'),
      ),
    );
  }
}
