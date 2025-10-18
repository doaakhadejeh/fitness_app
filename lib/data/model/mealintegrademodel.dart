class MealIngredientModel {
  final int id;
  final String ingredientName;

  MealIngredientModel({
    required this.id,
    required this.ingredientName,
  });

  factory MealIngredientModel.fromJson(Map<String, dynamic> json) {
    return MealIngredientModel(
      id: json['id'],
      ingredientName: json['ingredient_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ingredient_name': ingredientName,
    };
  }
}
