class Tematica {
  final String id;
  final String title;
  final String description;
  final List<Checklist> checklist;

  Tematica({
    required this.id,
    required this.title,
    required this.description,
    required this.checklist,
  });

  factory Tematica.fromJson(Map<String, dynamic> json) {
    var checklistFromJson = (json['checklist'] as List)
        .map((checklist) => Checklist.fromJson(checklist))
        .toList();

    return Tematica(
      id: json['id'],
      title: json['title']['it'],
      description: json['description']['it'],
      checklist: checklistFromJson,
    );
  }
}
