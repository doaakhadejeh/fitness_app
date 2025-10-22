class HealthProfileModel {
  final int? id;
  final int? userId;
  final String? fullName;
  final int? age;
  final double? weight;
  final double? height;
  final String? fitnessLevel;
  final String? goal;
  final String? gender;
  final String? fatDistribution;
  final String? chronicDiseasesOrInjuries;
  final double? waistCircumference;
  final double? hipCircumference;
  final double? chestCircumference;
  final double? armCircumference;
  final int? workoutDaysPerWeek;
  final int? preferredMealsCount;
  final DateTime? lastUpdatedAt;

  HealthProfileModel({
    this.id,
    this.userId,
    this.fullName,
    this.age,
    this.weight,
    this.height,
    this.fitnessLevel,
    this.goal,
    this.gender,
    this.fatDistribution,
    this.chronicDiseasesOrInjuries,
    this.waistCircumference,
    this.hipCircumference,
    this.chestCircumference,
    this.armCircumference,
    this.workoutDaysPerWeek,
    this.preferredMealsCount,
    this.lastUpdatedAt,
  });

  factory HealthProfileModel.fromJson(Map<String, dynamic> json) {
    return HealthProfileModel(
      id: json['id'],
      userId: json['user_id'],
      fullName: json['full_name'],
      age: json['age'],
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      fitnessLevel: json['fitness_level'],
      goal: json['goal'],
      gender: json['gender'],
      fatDistribution: json['fat_distribution'],
      chronicDiseasesOrInjuries: json['chronic_diseases_or_injuries'],
      waistCircumference: (json['waist_circumference'] as num?)?.toDouble(),
      hipCircumference: (json['hip_circumference'] as num?)?.toDouble(),
      chestCircumference: (json['chest_circumference'] as num?)?.toDouble(),
      armCircumference: (json['arm_circumference'] as num?)?.toDouble(),
      workoutDaysPerWeek: (json['workout_days_per_week'] as num?)?.toInt(),
      preferredMealsCount: int.tryParse(json['preferred_meals_count'] ?? ''),
      lastUpdatedAt: json['last_updated_at'] != null
          ? DateTime.parse(json['last_updated_at'])
          : null,
    );
  }
}
