import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:aiver_mobile/src/models/sector_subsector_model.dart';  // Per i settori
import 'package:aiver_mobile/src/models/checklist_model.dart';  // Per checklist e zone (rinominato)
import 'package:aiver_mobile/src/models/special_checklist_model.dart';  // Per le checklist speciali
import 'package:aiver_mobile/src/models/tematica_model.dart';  // Per le tematiche

class DataParser {
  // Carica un Settore o Sottosettore specifico (usa SectorSubsector)
  Future<SectorSubsector> loadSector(String sectorId) async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/checklist/settori/$sectorId/$sectorId.json');
      return SectorSubsector.fromJson(json.decode(jsonData));  // Usa SectorSubsector per il settore
    } catch (e) {
      throw Exception("Errore nel caricamento del settore: $sectorId");
    }
  }

  // Carica una Checklist Speciale
  Future<List<SpecialChecklist>> loadSpecialChecklist(String specialChecklistId) async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/checklist/checklist_speciali/$specialChecklistId.json');
      var decodedData = json.decode(jsonData) as List;
      return decodedData.map((e) => SpecialChecklist.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Errore nel caricamento della checklist speciale: $specialChecklistId");
    }
  }

  // Carica le Zone di un Settore (usa SectorZoneChecklist)
  Future<List<SectorZoneChecklist>> loadZones(String sectorId) async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/checklist/settori/$sectorId/zone_$sectorId.json');
      var decodedData = json.decode(jsonData) as List;
      return decodedData.map((e) => SectorZoneChecklist.fromJson(e)).toList();  // Usa SectorZoneChecklist per le zone
    } catch (e) {
      throw Exception("Errore nel caricamento delle zone per il settore: $sectorId");
    }
  }

  // Carica una Tematica
  Future<Tematica> loadTematica(String tematicaId) async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/checklist/tematiche/$tematicaId.json');
      return Tematica.fromJson(json.decode(jsonData));
    } catch (e) {
      throw Exception("Errore nel caricamento della tematica: $tematicaId");
    }
  }

  // Carica tutti i Settori (usa SectorSubsector)
  Future<List<SectorSubsector>> loadAllSectors() async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/checklist/settori/all_sectors.json');
      var decodedData = json.decode(jsonData) as List;
      return decodedData.map((e) => SectorSubsector.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Errore nel caricamento di tutti i settori.");
    }
  }

  // Carica tutte le Checklist per una Zona specifica (usa Checklist)
  Future<List<Checklist>> loadChecklistsForZone(String zoneId) async {
    try {
      final jsonData = await rootBundle.loadString('assets/data/checklist/zone_comuni/$zoneId.json');
      var decodedData = json.decode(jsonData) as List;
      return decodedData.map((e) => Checklist.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Errore nel caricamento delle checklist per la zona: $zoneId");
    }
  }
}
