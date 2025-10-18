import 'package:fitnessapp/controller/controlleradmin/exdayplan/exdayplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayExPlanView extends StatelessWidget {
  const DayExPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DayexplanViewController());
    return GetBuilder<DayexplanViewController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Exercises for this Day"),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                controller.getexdayPlans();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(
              Approut.addexdayplan,
              arguments: {
                "planid": controller.planid,
                "dayid": controller.dayid,
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: controller.exdayplans.isEmpty
              ? const Center(child: Text("No exercises found."))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: controller.exdayplans.length,
                  itemBuilder: (context, index) {
                    final exercise = controller.exdayplans[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          controller.exdayplans[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Repeats: ${exercise.recommendedRepeats}, Sets: ${exercise.sets}"),
                            if (exercise.restTimeSeconds != null)
                              Text(
                                  "Rest Time: ${exercise.restTimeSeconds} sec"),
                            if (exercise.notes != null &&
                                exercise.notes!.isNotEmpty)
                              Text("Notes: ${exercise.notes}"),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Colors.deepPurple),
                              onPressed: () {
                                Get.toNamed(
                                  Approut.editexdayplan,
                                  arguments: {
                                    "planid": controller.planid,
                                    "dayid": controller.dayid,
                                    "exerciseid": exercise.id,
                                    "recommended_repeats":
                                        exercise.recommendedRepeats,
                                    "sets": exercise.sets,
                                    "rest_time_seconds":
                                        exercise.restTimeSeconds,
                                    "notes": exercise.notes,
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.deepPurple),
                              onPressed: () {
                                _showDeleteDialog(context, controller,
                                    controller.exdayplans[index].id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      );
    });
  }

  void _showDeleteDialog(BuildContext context,
      DayexplanViewController controller, int exerciseId) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete this exercise?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              controller.deleteplan(exerciseId.toString());
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
