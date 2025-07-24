class SectorSubsector {
  final String id;
  final String title;
  final String description;
  final bool hasSubsectors;
  final List<String> comunes;
  final List<String> tematiche;
  final List<String> specifiche;
  final List<SectorSubsector>? subsectors; // Per i sottosettori
  String? selectedZone; // Zona selezionata
  String? subsector; // Sottosettore selezionato
  List<String> selectedChecklists; // Checklist selezionate
  List<String> selectedSpecialChecklists; // Checklist speciali selezionate

  // Aggiungiamo il costruttore con valori predefiniti
  SectorSubsector({
    required this.id,
    required this.title,
    required this.description,
    required this.hasSubsectors,
    required this.comunes,
    required this.tematiche,
    required this.specifiche,
    this.subsectors,
    this.selectedZone,
    this.subsector, // Aggiunto il parametro per il sottosettore
    this.selectedChecklists = const [],
    this.selectedSpecialChecklists = const [],
  });

  // Metodo per creare una copia del modello con modifiche
  SectorSubsector copyWith({
    String? selectedZone,
    String? subsector, // Aggiunto il parametro per il sottosettore
    List<String>? selectedChecklists,
    List<String>? selectedSpecialChecklists,
  }) {
    return SectorSubsector(
      id: this.id, // id non deve essere modificato, viene mantenuto
      title: this.title,
      description: this.description,
      hasSubsectors: this.hasSubsectors,
      comunes: this.comunes,
      tematiche: this.tematiche,
      specifiche: this.specifiche,
      subsectors: this.subsectors,
      selectedZone: selectedZone ?? this.selectedZone,
      subsector: subsector ?? this.subsector, // Aggiunto il parametro per il sottosettore
      selectedChecklists: selectedChecklists ?? this.selectedChecklists,
      selectedSpecialChecklists: selectedSpecialChecklists ?? this.selectedSpecialChecklists,
    );
  }

  // Metodo per convertire l'oggetto in Map (utile per il salvataggio o la serializzazione)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'has_subsectors': hasSubsectors,
      'comuni': comunes,
      'tematiche': tematiche,
      'specifiche': specifiche,
      'subsectors': subsectors?.map((subsector) => subsector.toMap()).toList(),
      'selectedZone': selectedZone,
      'subsector': subsector, // Aggiunto il campo per il sottosettore
      'selectedChecklists': selectedChecklists,
      'selectedSpecialChecklists': selectedSpecialChecklists,
    };
  }

  // Factory per creare il modello da JSON
  factory SectorSubsector.fromJson(Map<String, dynamic> json) {
    return SectorSubsector(
      id: json['id'], // Assicurati che il campo 'id' sia corretto nel JSON
      title: json['title']['it'],
      description: json['description']['it'],
      hasSubsectors: json['has_subsectors'],
      comunes: List<String>.from(json['comuni'] ?? []),
      tematiche: List<String>.from(json['tematiche'] ?? []),
      specifiche: List<String>.from(json['specifiche'] ?? []),
      subsectors: json['subsectors'] != null
          ? List<SectorSubsector>.from(
        json['subsectors'].map((subsector) => SectorSubsector.fromJson(subsector)),
      )
          : null,
      selectedZone: json['selectedZone'],
      subsector: json['subsector'], // Aggiunto il campo per il sottosettore
      selectedChecklists: List<String>.from(json['selectedChecklists'] ?? []),
      selectedSpecialChecklists: List<String>.from(json['selectedSpecialChecklists'] ?? []),
    );
  }
}
