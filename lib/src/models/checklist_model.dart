class Checklist {
  final String id;
  final String text;
  final bool mandatory;
  final double scoringWeight;
  final bool dpiLinked;
  final bool allowPhoto;
  final bool allowAudio;
  final bool allowFile;
  final bool note;  // Aggiungi il campo per le note

  Checklist({
    required this.id,
    required this.text,
    required this.mandatory,
    required this.scoringWeight,
    required this.dpiLinked,
    required this.allowPhoto,
    required this.allowAudio,
    required this.allowFile,
    required this.note, // Aggiunto per le note
  });

  factory Checklist.fromJson(Map<String, dynamic> json) {
    return Checklist(
      id: json['id'],
      text: json['text']['it'],
      mandatory: json['mandatory'],
      scoringWeight: json['scoring_weight'],
      dpiLinked: json['dpi_linked'],
      allowPhoto: json['allow_photo'],
      allowAudio: json['allow_audio'],
      allowFile: json['allow_file'],
      note: json['note'] ?? false,  // Gestione delle note
    );
  }
}

class SectorZoneChecklist {
  final String id;
  final String title;
  final String description;
  final bool hasSubsectors;
  final List<String> comunes;
  final List<String> tematiche;
  final List<String> specifiche;
  final List<SectorZoneChecklist>? subsectors;
  String? selectedZone;
  String? subsector;
  List<String> selectedChecklists;
  List<String> selectedSpecialChecklists;

  SectorZoneChecklist({
    required this.id,
    required this.title,
    required this.description,
    required this.hasSubsectors,
    required this.comunes,
    required this.tematiche,
    required this.specifiche,
    this.subsectors,
    this.selectedZone,
    this.subsector,
    this.selectedChecklists = const [],
    this.selectedSpecialChecklists = const [],
  });

  SectorZoneChecklist copyWith({
    String? selectedZone,
    String? subsector,
    List<String>? selectedChecklists,
    List<String>? selectedSpecialChecklists,
  }) {
    return SectorZoneChecklist(
      id: this.id,
      title: this.title,
      description: this.description,
      hasSubsectors: this.hasSubsectors,
      comunes: this.comunes,
      tematiche: this.tematiche,
      specifiche: this.specifiche,
      subsectors: this.subsectors,
      selectedZone: selectedZone ?? this.selectedZone,
      subsector: subsector ?? this.subsector,
      selectedChecklists: selectedChecklists ?? this.selectedChecklists,
      selectedSpecialChecklists: selectedSpecialChecklists ?? this.selectedSpecialChecklists,
    );
  }

  factory SectorZoneChecklist.fromJson(Map<String, dynamic> json) {
    return SectorZoneChecklist(
      id: json['id'],
      title: json['title']['it'],
      description: json['description']['it'],
      hasSubsectors: json['has_subsectors'],
      comunes: List<String>.from(json['comuni'] ?? []),
      tematiche: List<String>.from(json['tematiche'] ?? []),
      specifiche: List<String>.from(json['specifiche'] ?? []),
      subsectors: json['subsectors'] != null
          ? List<SectorZoneChecklist>.from(
        json['subsectors'].map((subsector) => SectorZoneChecklist.fromJson(subsector)),
      )
          : null,
      selectedZone: json['selectedZone'],
      subsector: json['subsector'],
      selectedChecklists: List<String>.from(json['selectedChecklists'] ?? []),
      selectedSpecialChecklists: List<String>.from(json['selectedSpecialChecklists'] ?? []),
    );
  }
}
