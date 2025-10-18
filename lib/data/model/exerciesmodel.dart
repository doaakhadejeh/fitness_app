import 'package:fitnessapp/data/model/categoriesmodel.dart';

class Exercisemodel {
  final int id;
  final String title;
  final String videoUrl;
  final int exerciseCategoryId;
  final String? description;
  final String? accessType; // public / private / null
  final int isActive;
  final int? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ExerciseCategorymodel? category;

  Exercisemodel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.exerciseCategoryId,
    this.description,
    this.accessType,
    required this.isActive,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Exercisemodel.fromJson(Map<String, dynamic> json) {
    return Exercisemodel(
      id: json['id'],
      title: json['title'],
      videoUrl: json['video_path'],
      exerciseCategoryId: json['exercise_category_id'],
      description: json['description'],
      accessType: json['access_type'],
      isActive: json['is_active'],
      createdBy: json['created_by'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      category: json['category'] != null
          ? ExerciseCategorymodel.fromJson(json['category'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'video_full_url': videoUrl,
      'exercise_category_id': exerciseCategoryId,
      'description': description,
      'access_type': accessType,
      'is_active': isActive,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'category': category?.toJson(),
    };
  }
}
