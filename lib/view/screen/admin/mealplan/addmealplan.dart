import 'package:fitnessapp/controller/controlleradmin/mealplan/addmealplancontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMealPlanPage extends StatelessWidget {
  const AddMealPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddMealPlanController());

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Meal Plan")),
      body: GetBuilder<AddMealPlanController>(
        builder: (controller) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.title,
                        decoration: const InputDecoration(labelText: "Title"),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: controller.type,
                        onChanged: (val) {
                          controller.type = val!;
                          controller.update();
                        },
                        items: const [
                          DropdownMenuItem(
                              value: "general", child: Text("General")),
                          DropdownMenuItem(
                              value: "private", child: Text("Private")),
                        ],
                        decoration: const InputDecoration(labelText: "Type"),
                      ),
                      const SizedBox(height: 10),
                      if (controller.type == "private")
                        DropdownButtonFormField<String>(
                          value: controller.goal,
                          onChanged: (val) {
                            controller.goal = val!;
                            controller.update();
                          },
                          items: const [
                            DropdownMenuItem(
                                value: "lose_weight",
                                child: Text("Lose Weight")),
                            DropdownMenuItem(
                                value: "gain_weight",
                                child: Text("Gain Weight")),
                            DropdownMenuItem(
                                value: "build_muscle",
                                child: Text("Build Muscle")),
                            DropdownMenuItem(
                                value: "stay_fit", child: Text("Stay Fit")),
                          ],
                          decoration: const InputDecoration(labelText: "Goal"),
                        ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.description,
                        maxLines: 3,
                        decoration:
                            const InputDecoration(labelText: "Description"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.note,
                        maxLines: 2,
                        decoration: const InputDecoration(labelText: "Note"),
                      ),
                      const SizedBox(height: 10),
                      CheckboxListTile(
                        title: const Text("Is Default?"),
                        value: controller.isDefault,
                        onChanged: (val) {
                          controller.isDefault = val!;
                          controller.update();
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Select Meals",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      ...controller.allMeals.map((meal) {
                        return CheckboxListTile(
                          value: controller.selectedMealIds.contains(meal.id),
                          title: Text(meal.name),
                          onChanged: (val) {
                            controller.toggleMealSelection(meal.id);
                          },
                        );
                      }).toList(),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          controller.addMealPlan();
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
