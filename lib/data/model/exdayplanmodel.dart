class PlanExerciseModel {
  final int id;
  final String title;
  final String videoUrl;
  final int exerciseCategoryId;
  final String? description;
  final String? accessType;
  final int isActive;
  final int? recommendedRepeats;
  final int? sets;
  final int? restTimeSeconds;
  final String? notes;

  PlanExerciseModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.exerciseCategoryId,
    this.description,
    this.accessType,
    required this.isActive,
    this.recommendedRepeats,
    this.sets,
    this.restTimeSeconds,
    this.notes,
  });

  factory PlanExerciseModel.fromJson(Map<String, dynamic> json) {
    return PlanExerciseModel(
      id: json['id'],
      title: json['title'],
      videoUrl: json['video_url'],
      // ?.replaceFirst('http://127.0.0.1:8000', 'http://192.168.43.190:8000'),
      exerciseCategoryId: json['exercise_category_id'],
      description: json['description'],
      accessType: json['access_type'],
      isActive: json['is_active'],
      recommendedRepeats: json['recommended_repeats'],
      sets: json['sets'],
      restTimeSeconds: json['rest_time_seconds'],
      notes: json['notes'],
    );
  }
}
