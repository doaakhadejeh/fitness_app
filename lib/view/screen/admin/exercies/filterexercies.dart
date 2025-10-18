import 'package:fitnessapp/controller/controlleradmin/exercies/filterxerciescontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterExercisesPage extends StatelessWidget {
  const FilterExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FilterExercisesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Exercises"),
        backgroundColor: Colors.deepPurple.shade600,
      ),
      body: GetBuilder<FilterExercisesController>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  // Category Dropdown
                  DropdownButtonFormField<int>(
                    decoration: const InputDecoration(
                      labelText: "Category",
                      prefixIcon: Icon(Icons.category),
                    ),
                    value: controller.selectedCategoryId,
                    items: List.generate(
                      10,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("Category ${index + 1}"),
                      ),
                    ),
                    onChanged: (value) {
                      controller.selectedCategoryId = value;
                      controller.update();
                    },
                  ),
                  const SizedBox(height: 16),

                  // Access Type Dropdown
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Access Type",
                      prefixIcon: Icon(Icons.lock_open),
                    ),
                    value: controller.accessType,
                    items: const [
                      DropdownMenuItem(
                        value: "public",
                        child: Text("Public"),
                      ),
                      DropdownMenuItem(
                        value: "private",
                        child: Text("Private"),
                      ),
                    ],
                    onChanged: (value) {
                      controller.accessType = value;
                      controller.update();
                    },
                  ),
                  const SizedBox(height: 16),

                  // Active Switch
                  SwitchListTile(
                    title: const Text("Active Only"),
                    value: controller.isActive,
                    onChanged: (value) {
                      controller.isActive = value;
                      controller.update();
                    },
                    activeColor: Colors.deepPurple,
                  ),
                  const SizedBox(height: 20),

                  // Filter Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade600,
                    ),
                    onPressed: () {
                      controller.filterExercises();
                    },
                    child: const Text("Apply Filter"),
                  ),
                  const SizedBox(height: 20),

                  // Results
                  controller.exercises.isEmpty
                      ? const Text(
                          "No exercises found.",
                          style: TextStyle(color: Colors.grey),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.exercises.length,
                          itemBuilder: (context, index) {
                            final exercise = controller.exercises[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              color: Colors.purple.shade50,
                              child: ListTile(
                                title: Text(
                                  exercise["title"] ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Category ID: ${exercise["exercise_category_id"] ?? "-"}"),
                                    Text(
                                        "Access: ${exercise["access_type"] ?? "-"}"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
