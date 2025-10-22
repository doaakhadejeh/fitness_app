class ExerciseCategorymodel {
  final int id;
  final String name;
  final String image;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  ExerciseCategorymodel({
    required this.id,
    required this.name,
    required this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ExerciseCategorymodel.fromJson(Map<String, dynamic> json) {
    return ExerciseCategorymodel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
