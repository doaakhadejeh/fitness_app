import 'package:fitnessapp/controller/controlleradmin/mealIngredients/editmealgredientscontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMealIngredientPage extends StatelessWidget {
  const EditMealIngredientPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditMealIngredientController());

    return GetBuilder<EditMealIngredientController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Ingredient"),
          backgroundColor: Colors.deepPurple[900],
          foregroundColor: Colors.white,
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[800],
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  icon: const Icon(Icons.save),
                  label: const Text("Save Changes"),
                  onPressed: () => controller.updateIngredient(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
