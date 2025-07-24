import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:provider/provider.dart';
import 'package:aiver_mobile/src/services/data_parser.dart';
import 'package:aiver_mobile/src/ui/components/shared_appbar.dart';
import 'package:aiver_mobile/src/ui/components/shared_drawer.dart';
import 'package:aiver_mobile/gen/l10n/app_localizations.dart';
import 'package:aiver_mobile/src/ui/components/checklist_item.dart'; // Widget per la checklist
import 'package:aiver_mobile/src/models/sector_subsector_model.dart'; // Modelli per i settori
import 'package:aiver_mobile/src/providers/sector_subsector_provider.dart';
import 'package:aiver_mobile/src/models/checklist_model.dart'; // Modelli per zone e checklist
import 'package:aiver_mobile/src/constants/app_colors.dart';  // Importa il file dei colori
import 'package:aiver_mobile/src/constants/app_theme.dart';  // Importa il tema

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  @override
  void initState() {
    super.initState();
    // Carica i dati salvati all'inizio
    context.read<SectorSubsectorProvider>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    final sectorSubsectorState = context.watch<SectorSubsectorProvider>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: SharedAppBar(title: (l10n.menu_checklist)),
      drawer: const SharedDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(
            context,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Settore selection
                Tooltip(
                  message: l10n.select_sector_tooltip,
                  child: DropdownButton<String>(
                    hint: Text(l10n.select_sector),
                    value: sectorSubsectorState.sectorSubsector.id,
                    onChanged: (String? newValue) {
                      setState(() {
                        context.read<SectorSubsectorProvider>().setSector(newValue!);
                        context.read<SectorSubsectorProvider>().resetSubsector(); // Reset sottosettore quando si cambia il settore
                      });
                    },
                    items: sectorSubsectorState.sectorsData.map<DropdownMenuItem<String>>(
                          (SectorSubsector sector) {
                        return DropdownMenuItem<String>(
                          value: sector.id,
                          child: Text(sector.title),
                        );
                      },
                    ).toList(),
                  ),
                ),

                // Sottosettore selection (only for "Industria")
                if (sectorSubsectorState.sectorSubsector.id == 'industria')
                  Tooltip(
                    message: l10n.select_subsector_tooltip,
                    child: DropdownButton<String>(
                      hint: Text(l10n.select_subsector),
                      value: sectorSubsectorState.sectorSubsector.subsector,
                      onChanged: (String? newValue) {
                        setState(() {
                          context.read<SectorSubsectorProvider>().setSubsector(newValue!);
                        });
                      },
                      items: sectorSubsectorState.subsectorsData.map<DropdownMenuItem<String>>(
                            (SectorZoneChecklist subsector) {  // Usa SectorZoneChecklist qui
                          return DropdownMenuItem<String>(
                            value: subsector.id,
                            child: Text(subsector.title),
                          );
                        },
                      ).toList(),
                    ),
                  ),

                // Azzeramento delle selezioni
                ElevatedButton(
                  onPressed: () {
                    context.read<SectorSubsectorProvider>().resetData();  // Azzeramento dei dati
                  },
                  child: Text(l10n.reset_data),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary, // Usa 'backgroundColor' al posto di 'primary'
                    foregroundColor: Colors.white, // Usa 'foregroundColor' per il colore del testo
                  ),
                ),

                // Zone and checklist display
                if (sectorSubsectorState.sectorSubsector.id.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: sectorSubsectorState.zonesData.length, // Carica le zone
                      itemBuilder: (context, index) {
                        String zone = sectorSubsectorState.zonesData[index].title; // Usa la proprietà title di SectorZoneChecklist
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ChecklistItem(zone: zone, checklistData: sectorSubsectorState.checklistData),
                            // Mostra checklist speciali attivabili
                            Text(
                              l10n.checklist_specials_header,
                              style: Theme.of(context).textTheme.headline5,  // Usa headline5
                            ),
                            for (var special in sectorSubsectorState.specialChecklists)
                              Text(special.title),
                          ],
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          maxWidth: 1200,
          minWidth: 350,
          defaultScale: false,
        ),
      ),
    );
  }
}
