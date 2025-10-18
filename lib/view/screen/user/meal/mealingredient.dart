import 'package:fitnessapp/controller/controlleruser/homes/mealingredientscontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealIngredientsPage extends StatelessWidget {
  const MealIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MealIngredientsController());
    return GetBuilder<MealIngredientsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Meal Ingredients"),
          // backgroundColor: Colors.deep[800],
          foregroundColor: Colors.deepPurple[800],
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = controller.ingredients[index];
              return Card(
                surfaceTintColor: Colors.white,
                // color: Colors.deepPurple[50],
                child: SizedBox(
                    // color: Colors.deepPurple[50],
                    height: 40,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(ingredient.ingredientName)),
                    )),
              );
            },
          ),
        ),
      );
    });
  }
}
