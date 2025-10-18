import 'package:fitnessapp/data/model/daymodel.dart';
import 'package:fitnessapp/data/model/usermode.dart';

class ExercisePlan {
  final int id;
  final String title;
  final String? note;
  final String type;
  final int isActive;
  final String goal;
  final String fitnessLevel;
  final int? userId;
  final int? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Usermodel? user;
  final Usermodel? createdByUser;
  final List<Daymodel>? days;

  ExercisePlan({
    required this.id,
    required this.title,
    this.note,
    required this.type,
    required this.isActive,
    required this.goal,
    required this.fitnessLevel,
    this.userId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.createdByUser,
    this.days,
  });

  factory ExercisePlan.fromJson(Map<String, dynamic> json) {
    return ExercisePlan(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      type: json['type'],
      isActive: json['is_active'],
      goal: json['goal'],
      fitnessLevel: json['fitness_level'],
      userId: json['user_id'],
      createdBy: json['created_by'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      user: json['user'] != null ? Usermodel.fromJson(json['user']) : null,
      createdByUser: json['createdBy'] != null
          ? Usermodel.fromJson(json['createdBy'])
          : null,
      days: json['days'] != null
          ? (json['days'] as List).map((d) => Daymodel.fromJson(d)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'type': type,
      'is_active': isActive,
      'goal': goal,
      'fitness_level': fitnessLevel,
      'user_id': userId,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'user': user?.toJson(),
      'createdBy': createdByUser?.toJson(),
      'days': days?.map((d) => d.toJson()).toList(),
    };
  }
}
