class Zone {
  final String id;
  final String title;
  final String description;
  final String type;  // "comune" o "specifica"
  final String sector;
  final List<Checklist> checklist;

  Zone({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.sector,
    required this.checklist,
  });

  factory Zone.fromJson(Map<String, dynamic> json) {
    var checklistFromJson = (json['checklist'] as List)
        .map((checklist) => Checklist.fromJson(checklist))
        .toList();

    return Zone(
      id: json['id'],
      title: json['title']['it'],
      description: json['description']['it'],
      type: json['type'],
      sector: json['sector'],
      checklist: checklistFromJson,
    );
  }
}
