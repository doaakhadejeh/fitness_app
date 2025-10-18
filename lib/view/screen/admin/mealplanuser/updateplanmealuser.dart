import 'package:fitnessapp/controller/controlleradmin/mealplanuser/updatemealplanusercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';

class EditMealprUser extends StatelessWidget {
  const EditMealprUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditMealUserController());

    return GetBuilder<EditMealUserController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Meal Plan"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple.shade600,
          foregroundColor: Colors.white,
        ),
        body: Handlingdatarequest(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                DropdownButtonFormField<int>(
                  value: controller.selectedMealPlanId,
                  items: controller.mealPlans
                      .map((plan) => DropdownMenuItem(
                            value: plan.id,
                            child: Text(plan.title),
                          ))
                      .toList(),
                  onChanged: (value) => controller.selectedMealPlanId = value,
                  decoration:
                      const InputDecoration(labelText: "Select Meal Plan"),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.startDate,
                  decoration: const InputDecoration(
                      labelText: "Start Date (YYYY-MM-DD)"),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.endDate,
                  decoration:
                      const InputDecoration(labelText: "End Date (YYYY-MM-DD)"),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => controller.assignMealPlan(),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple.shade800),
                  child: const Text("Update Meal Plan"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
