import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:aiver_mobile/src/models/sector_subsector_model.dart';  // Per i settori
import 'package:aiver_mobile/src/models/checklist_model.dart';  // Per la gestione delle checklist
import 'package:aiver_mobile/src/models/zone_model.dart';  // Per la gestione delle zone e checklist (rinominato)
import 'package:aiver_mobile/src/models/special_checklist_model.dart';  // Per le checklist speciali
import 'package:aiver_mobile/src/models/tematica_model.dart';  // Per le tematiche

class DataService {
  // Carica un settore o sottosettore specifico
  Future<SectorSubsector> loadSector(String sectorId) async {
    final jsonData = await rootBundle.loadString('assets/data/checklist/settori/$sectorId/$sectorId.json');
    return SectorSubsector.fromJson(json.decode(jsonData));
  }

  // Carica una checklist speciale
  Future<List<SpecialChecklist>> loadSpecialChecklist(String sectorId) async {
    final jsonData = await rootBundle.loadString('assets/data/checklist/checklist_speciali/$sectorId.json');
    var decodedData = json.decode(jsonData) as List;
    return decodedData.map((e) => SpecialChecklist.fromJson(e)).toList();
  }

  // Carica le zone di un settore (usa SectorZoneChecklist)
  Future<List<SectorZoneChecklist>> loadZones(String sectorId) async {
    final jsonData = await rootBundle.loadString('assets/data/checklist/settori/$sectorId/zone_$sectorId.json');
    var decodedData = json.decode(jsonData) as List;
    return decodedData.map((e) => SectorZoneChecklist.fromJson(e)).toList();  // Usa SectorZoneChecklist per le zone
  }

  // Carica una tematica
  Future<Tematica> loadTematica(String tematicaId) async {
    final jsonData = await rootBundle.loadString('assets/data/checklist/tematiche/$tematicaId.json');
    return Tematica.fromJson(json.decode(jsonData));
  }
}
