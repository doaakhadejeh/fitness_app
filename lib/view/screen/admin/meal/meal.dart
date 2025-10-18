import 'package:fitnessapp/controller/controlleradmin/meal/mealcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Meal extends StatelessWidget {
  const Meal({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MealAdmincontroller());
    return GetBuilder<MealAdmincontroller>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: const Text("Meal Management"),
          foregroundColor: Colors.deepPurple[600],
          backgroundColor: Colors.deepPurple[50],
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                Get.find<MealAdmincontroller>().getAllMeals();
              },
            ),
          ],
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.meals.length,
            itemBuilder: (context, index) {
              final meal = controller.meals[index];
              return Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 150,
                  width: 600,
                  child: Row(
                    children: [
                      meal.imagePath != null
                          ? Image.network(
                              "${Imageconst.imageback}${meal.imagePath}",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.fastfood, size: 40),
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          title: Text(
                            meal.name,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "-desc: ${meal.description}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                "-Time: ${meal.mealTime}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              // Text("Ingredients: ${meal.ingredients.length}"),
                              // Text("calories: ${meal.calories}"),
                              // Text("carbs: ${meal.carbs}"),
                              // Text("healthyFats: ${meal.healthyFats}"),
                              // Text("protein: ${meal.protein}"),
                              // Text("quantityGrams: ${meal.quantityGrams}"),
                            ],
                          ),
                          trailing: PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'editMeal') {
                                Get.toNamed(Approut.editmeal, arguments: {
                                  'meal': meal.toJson(),
                                });
                              } else if (value == 'Ingredients') {
                                Get.toNamed(Approut.mealing, arguments: {
                                  'mealId': meal.id,
                                });
                              } else if (value == 'delete') {
                                _confirmDelete(context, meal.id, controller);
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              const PopupMenuItem(
                                value: 'editMeal',
                                child: Text('Edit Meal'),
                              ),
                              const PopupMenuItem(
                                value: 'Ingredients',
                                child: Text(' Ingredients'),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete Meal',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Approut.addmeal);
          },
          backgroundColor: Colors.deepPurple[600],
          foregroundColor: Colors.deepPurple[50],
          child: const Icon(Icons.add),
        ),
      );
    });
  }

  void _confirmDelete(
      BuildContext context, int mealId, MealAdmincontroller controller) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Are you sure?"),
        content: const Text("This meal will be permanently deleted."),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Get.back();
              await controller.deleteMeals(mealId);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
