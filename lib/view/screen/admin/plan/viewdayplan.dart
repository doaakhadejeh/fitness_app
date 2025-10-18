import 'package:fitnessapp/controller/controlleradmin/dayplan/dayplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Viewdayplan extends StatelessWidget {
  const Viewdayplan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DayplanViewController());
    return GetBuilder<DayplanViewController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Days in Plan"),
            // backgroundColor: Colors.purple,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  controller.getdayPlans();
                },
              ),
            ],
          ),
          body: Handlingdatarequest(
            stateerr: controller.stateerr,
            child: controller.dayplans.isEmpty
                ? const Center(
                    child: Text(
                      "No days found.",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: controller.dayplans.length,
                    itemBuilder: (context, index) {
                      final day = controller.dayplans[index];
                      return Card(
                        color: Colors.purple.shade50,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple.shade200,
                            child: Text(
                              "${day.dayNumber}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            day.description,
                            style: const TextStyle(fontSize: 20),
                          ),
                          trailing: SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit,
                                      size: 25, color: Colors.deepPurple[900]),
                                  onPressed: () {
                                    Get.toNamed(
                                      Approut.editdayplan,
                                      arguments: {
                                        "dayid": day.id,
                                        "planid": controller.id,
                                        "day_number": day.dayNumber,
                                        "description": day.description,
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete,
                                      size: 25, color: Colors.deepPurple[900]),
                                  onPressed: () {
                                    controller.deleteplan(day.id.toString());
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.fitness_center,
                                      size: 25, color: Colors.deepPurple[900]),
                                  onPressed: () {
                                    Get.toNamed(
                                      Approut.exdayplan,
                                      arguments: {
                                        "dayid": day.id,
                                        "planid": controller.id,
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple[900],
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(
                Approut.adddayplan,
                arguments: {"planid": controller.id},
              );
            },
          ),
        );
      },
    );
  }
}
