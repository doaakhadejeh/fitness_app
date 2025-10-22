import 'package:fitnessapp/controller/controlleradmin/mealIngredients/mealingredientscontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealIngredientsAdminPage extends StatelessWidget {
  const MealIngredientsAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MealIngredientsAdminController());
    return GetBuilder<MealIngredientsAdminController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Meal Ingredients"),
          backgroundColor: Colors.deepPurple[900],
          foregroundColor: Colors.white,
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = controller.ingredients[index];
              return Card(
                child: ListTile(
                  title: Text(ingredient.ingredientName),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Get.toNamed(Approut.editmealing, arguments: {
                            'mealId': controller.mealId,
                            'ingredientid': ingredient.id,
                            'ingredientname': ingredient.ingredientName,
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _confirmDelete(context, ingredient.id, controller);
                        },
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
            Get.toNamed(Approut.addmealing, arguments: {
              'mealId': controller.mealId,
            });
          },
          backgroundColor: Colors.deepPurple[900],
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      );
    });
  }

  void _confirmDelete(BuildContext context, int ingredientId,
      MealIngredientsAdminController controller) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Are you sure?"),
        content: const Text("Do you want to delete this ingredient?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Get.back();
              await controller.deleteIngredient(ingredientId);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
