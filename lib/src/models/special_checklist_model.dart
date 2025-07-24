class SpecialChecklist {
  final String id;
  final String title;
  final String description;
  final String activationQuestion;

  SpecialChecklist({
    required this.id,
    required this.title,
    required this.description,
    required this.activationQuestion,
  });

  factory SpecialChecklist.fromJson(Map<String, dynamic> json) {
    return SpecialChecklist(
      id: json['id'],
      title: json['title']['it'],
      description: json['description']['it'],
      activationQuestion: json['activation_question']['it'],
    );
  }
}
