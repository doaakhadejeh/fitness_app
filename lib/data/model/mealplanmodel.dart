class MealPlanModel {
  final int id;
  final String title;
  final String type;
  final String? description;
  final String? goal;
  final String? note;
  final int isDefault;

  MealPlanModel({
    required this.id,
    required this.title,
    required this.type,
    this.description,
    this.goal,
    this.note,
    required this.isDefault,
  });

  factory MealPlanModel.fromJson(Map<String, dynamic> json) {
    return MealPlanModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      type: json['type'] ?? '',
      description: json['description'] ?? '',
      goal: json['goal'] ?? "",
      note: json['note'] ?? "",
      isDefault: json['is_default'] ?? 0,
    );
  }
}
