import 'package:fitnessapp/controller/controlleradmin/mealplan/detmealplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPlanDetailsPage extends StatelessWidget {
  const MealPlanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MealPlanDetailsController());
    return GetBuilder<MealPlanDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Meal Plan Details"),
            foregroundColor: Colors.deepPurple,
          ),
          body: Handlingdatarequest(
            stateerr: controller.stateerr,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text("Title: ${controller.title}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Type: ${controller.type}"),
                  if (controller.goal != null) Text("Goal: ${controller.goal}"),
                  if (controller.note != null) Text("Note: ${controller.note}"),
                  if (controller.description != null)
                    Text("Description: ${controller.description}"),
                  const SizedBox(height: 16),
                  const Divider(),
                  const Text("Meals",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                  const SizedBox(height: 8),
                  ...controller.meals.map((meal) {
                    return Card(
                      color: Colors.deepPurple[100]!.withOpacity(0.6),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(meal.name,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    decoration: TextDecoration.underline)),
                            const SizedBox(height: 4),
                            if (meal.ingredients.isNotEmpty) ...[
                              const Text(
                                "-Ingredients:",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              ...meal.ingredients.map((ing) => Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("• ${ing.ingredientName}"),
                                  )),
                            ] else
                              const Text("No ingredients listed."),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
