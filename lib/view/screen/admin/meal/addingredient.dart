import 'package:fitnessapp/controller/controlleradmin/mealIngredients/addmealgredientcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMealIngredientPage extends StatelessWidget {
  const AddMealIngredientPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddMealIngredientController());

    return GetBuilder<AddMealIngredientController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add Ingredient"),
          backgroundColor: Colors.deepPurple[900],
          foregroundColor: Colors.white,
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.ingredientName,
                  decoration: const InputDecoration(
                    labelText: "Ingredient Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[900],
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (controller.ingredientName.text.trim().isNotEmpty) {
                      controller.addIngredient();
                    } else {
                      Get.snackbar("Validation", "Ingredient name is required",
                          backgroundColor: Colors.red[300],
                          colorText: Colors.white);
                    }
                  },
                  child: const Text("Add Ingredient"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
