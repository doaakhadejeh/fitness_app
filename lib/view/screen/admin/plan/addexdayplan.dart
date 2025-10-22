import 'package:fitnessapp/controller/controlleradmin/exdayplan/addexdayplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExDayPlan extends StatelessWidget {
  const AddExDayPlan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddExDayPlanController());
    return GetBuilder<AddExDayPlanController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add Exercise to Day"),
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DropdownButtonFormField<int>(
                    value: controller.selectedExerciseId,
                    decoration: const InputDecoration(
                      labelText: "Choose Exercise",
                      border: OutlineInputBorder(),
                    ),
                    items: controller.exercisesList.map((exercise) {
                      return DropdownMenuItem<int>(
                        value: exercise.id,
                        child: Text(exercise.title),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedExerciseId = value;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller.recommendedRepeatsController,
                    decoration: const InputDecoration(
                      labelText: "Recommended Repeats",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller.setsController,
                    decoration: const InputDecoration(
                      labelText: "Sets",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller.restTimeController,
                    decoration: const InputDecoration(
                      labelText: "Rest Time (Seconds)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller.notesController,
                    decoration: const InputDecoration(
                      labelText: "Notes",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.addExerciseToDay();
                    },
                    child: const Text("Add Exercise"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
