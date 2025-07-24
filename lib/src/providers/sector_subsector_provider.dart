import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aiver_mobile/src/models/sector_subsector_model.dart'; // For sector management
import 'package:aiver_mobile/src/models/checklist_model.dart'; // For checklist and zones

class SectorSubsectorProvider extends ChangeNotifier {
  // Initial state for the sector with all required parameters
  SectorSubsector _sectorSubsector = SectorSubsector(
    id: 'agricoltura_zootecnica',
    title: 'Agricoltura / Zootecnia',
    description: 'Attività agricole e zootecniche...',
    hasSubsectors: false,
    comunes: [],
    tematiche: [],
    specifiche: [],
    subsectors: [],
    selectedZone: null,
    subsector: null,
    selectedChecklists: [],
    selectedSpecialChecklists: [],
  );

  // Initial state for the checklist
  SectorZoneChecklist _checklistData = SectorZoneChecklist(
    id: 'default',
    selectedChecklists: [],
    selectedSpecialChecklists: [],
    title: '', description: '', hasSubsectors: null, comunes: [], tematiche: [], specifiche: [],
  );

  // Getter for sector state
  SectorSubsector get sectorSubsector => _sectorSubsector;

  // Getter for checklist state
  SectorZoneChecklist get checklistData => _checklistData;

  // Set the selected sector
  void setSector(String sectorId) {
    _sectorSubsector = _sectorSubsector.copyWith(id: sectorId);
    notifyListeners();
    saveData();
  }

  // Set the selected subsector
  void setSubsector(String? subsectorId) {
    _sectorSubsector = _sectorSubsector.copyWith(subsector: subsectorId);
    notifyListeners();
    saveData();
  }

  // Set the selected zone
  void setZone(String? zone) {
    _sectorSubsector = _sectorSubsector.copyWith(selectedZone: zone);
    notifyListeners();
    saveData();
  }

  // Add a checklist
  void addChecklist(String checklistId) {
    _checklistData = _checklistData.copyWith(
      selectedChecklists: [..._checklistData.selectedChecklists, checklistId],
    );
    notifyListeners();
    saveData();
  }

  // Remove a checklist
  void removeChecklist(String checklistId) {
    _checklistData = _checklistData.copyWith(
      selectedChecklists: _checklistData.selectedChecklists.where((e) => e != checklistId).toList(),
    );
    notifyListeners();
    saveData();
  }

  // Load saved data
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    // Load sector data
    String sector = prefs.getString('sector') ?? 'agricoltura_zootecnica';
    String? subsector = prefs.getString('subsector');
    String? zone = prefs.getString('zone');
    List<String> checklists = prefs.getStringList('checklists') ?? [];
    List<String> specialChecklists = prefs.getStringList('specialChecklists') ?? [];

    _sectorSubsector = _sectorSubsector.copyWith(
      id: sector,
      subsector: subsector,
      selectedZone: zone,
      selectedChecklists: checklists,
      selectedSpecialChecklists: specialChecklists,
    );

    notifyListeners();
  }

  // Save data
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('sector', _sectorSubsector.id);
    prefs.setString('subsector', _sectorSubsector.subsector ?? '');
    prefs.setString('zone', _sectorSubsector.selectedZone ?? '');
    prefs.setStringList('checklists', _sectorSubsector.selectedChecklists);
    prefs.setStringList('specialChecklists', _sectorSubsector.selectedSpecialChecklists);
  }

  // Reset data
  Future<void> resetData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('sector');
    await prefs.remove('subsector');
    await prefs.remove('zone');
    await prefs.remove('checklists');
    await prefs.remove('specialChecklists');

    _sectorSubsector = SectorSubsector(
      id: 'agricoltura_zootecnica',
      title: 'Agricoltura / Zootecnia',
      description: 'Attività agricole e zootecniche...',
      hasSubsectors: false,
      comunes: [],
      tematiche: [],
      specifiche: [],
      subsectors: [],
      selectedZone: null,
      subsector: null,
      selectedChecklists: [],
      selectedSpecialChecklists: [],
    );

    notifyListeners();
  }

  // Reset subsector data (added for resetting subsector specifically)
  void resetSubsector() {
    _sectorSubsector = _sectorSubsector.copyWith(subsector: null);
    notifyListeners();
    saveData();
  }

  // Getter for sectors data
  List<SectorSubsector> _sectorsData = []; // Add your logic to load the actual data
  List<SectorSubsector> get sectorsData => _sectorsData;

  // Getter for subsectors data
  List<SectorZoneChecklist> _subsectorsData = []; // Add your logic to load the actual data
  List<SectorZoneChecklist> get subsectorsData => _subsectorsData;
}
