import 'package:fitnessapp/data/model/mealintegrademodel.dart';

class MealModel {
  final int id;
  final String name;
  final String mealTime;
  final String? description;
  final String? imagePath;

  final double quantityGrams;
  final double calories;
  final double protein;
  final double carbs;
  final double healthyFats;

  final List<MealIngredientModel> ingredients;

  MealModel({
    required this.id,
    required this.name,
    required this.mealTime,
    this.description,
    this.imagePath,
    required this.quantityGrams,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.healthyFats,
    required this.ingredients,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    double toDouble(dynamic value) {
      if (value == null) return 0.0;
      return double.tryParse(value.toString()) ?? 0.0;
    }

    return MealModel(
      id: json['id'],
      name: json['name'],
      mealTime: json['meal_time'],
      description: json['description'],
      imagePath: json['image_path']
          ?.toString()
          .replaceFirst('http://127.0.0.1:8000', 'http://192.168.43.190:8000'),
      quantityGrams: toDouble(json['quantity_grams']),
      calories: toDouble(json['calories']),
      protein: toDouble(json['protein']),
      carbs: toDouble(json['carbs']),
      healthyFats: toDouble(json['healthy_fats']),
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => MealIngredientModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'meal_time': mealTime,
      'description': description,
      'image_path': imagePath,
      'quantity_grams': quantityGrams,
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'healthy_fats': healthyFats,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
    };
  }
}
