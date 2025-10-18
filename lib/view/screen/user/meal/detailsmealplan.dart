import 'package:fitnessapp/controller/controlleruser/mealplan/detailsmealplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPlanUserDetails extends StatelessWidget {
  const MealPlanUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MealPlanUserDetailsController());

    return GetBuilder<MealPlanUserDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Meal Plan Details"),
          backgroundColor: Colors.deepPurple[600],
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Handlingdatarequest(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.mealPlan['title'] ?? '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[800],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Type: ${controller.mealPlan['type']}",
                  style: const TextStyle(fontSize: 16),
                ),
                if (controller.mealPlan['goal'] != null)
                  Text("Goal: ${controller.mealPlan['goal']}"),
                if (controller.mealPlan['note'] != null)
                  Text("Note: ${controller.mealPlan['note']}"),
                const SizedBox(height: 40),
                Text(
                  "Meals",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[600],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: (controller.mealPlan['meals'] ?? []).length,
                    itemBuilder: (context, index) {
                      final meal = controller.mealPlan['meals'][index];
                      return Card(
                        surfaceTintColor: Colors.deepPurple[200],
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 2,
                        child: ListTile(
                          title: Text(meal['name'] ?? 'No Name'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Time: ${meal['meal_time'] ?? ''}"),
                              if (meal['description'] != null)
                                Text("Desc: ${meal['description']}"),
                              Text("Calories: ${meal['calories'] ?? 0}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
