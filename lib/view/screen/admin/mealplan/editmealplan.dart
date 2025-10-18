import 'package:fitnessapp/controller/controlleradmin/mealplan/editmealplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMealPlanPage extends StatelessWidget {
  const EditMealPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditMealPlanController());
    return GetBuilder<EditMealPlanController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("Edit Meal Plan")),
          body: Handlingdatarequest(
            stateerr: controller.stateerr,
            child: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        TextFormField(
                          controller: controller.title,
                          decoration: const InputDecoration(labelText: "Title"),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.description,
                          decoration:
                              const InputDecoration(labelText: "Description"),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.note,
                          decoration: const InputDecoration(labelText: "Note"),
                        ),
                        const SizedBox(height: 10),
                        SwitchListTile(
                          title: const Text("Is Default"),
                          value: controller.isDefault,
                          onChanged: (val) {
                            controller.isDefault = val;
                            controller.update();
                          },
                        ),
                        const SizedBox(height: 10),
                        const Text("Type"),
                        DropdownButton<String>(
                          value: controller.type,
                          items: const [
                            DropdownMenuItem(
                                value: "general", child: Text("General")),
                            DropdownMenuItem(
                                value: "private", child: Text("Private")),
                          ],
                          onChanged: (val) {
                            controller.type = val!;
                            controller.update();
                          },
                        ),
                        if (controller.type == "private") ...[
                          const SizedBox(height: 10),
                          const Text("Goal"),
                          DropdownButton<String>(
                            value: controller.goal,
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
                            onChanged: (val) {
                              controller.goal = val!;
                              controller.update();
                            },
                          ),
                        ],
                        const SizedBox(height: 20),
                        const Text("Select Meals"),
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
                            controller.updateMealPlan();
                          },
                          child: const Text("Update Meal Plan"),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
