import 'package:fitnessapp/controller/controlleradmin/planuser/showplanusercontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/view/screen/admin/planuser/updateplanuser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanUser extends StatelessWidget {
  const PlanUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlanUserController());

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.deepPurple[600],
        backgroundColor: Colors.white,
        title: const Text("User's Workout Plans"),
        centerTitle: true,
      ),
      body: GetBuilder<PlanUserController>(builder: (controller) {
        return controller.plans.isEmpty
            ? Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const AddplanUser(),
                          arguments: {"id": controller.id});
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepPurple,
                        backgroundColor: Colors.white),
                    child: const Text("Add plan to this user")),
              )
            : Handlingdataview(
                stateerr: controller.stateerr,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.plans.length,
                          itemBuilder: (context, index) {
                            var plan = controller.plans[index];
                            return InkWell(
                              onTap: () {
                                // Get.toNamed(Approut.dayriplan,
                                //     arguments: {"planId": plan.id});
                              },
                              child: Card(
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                color: Colors.deepPurple[600]!.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(plan.title,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      const SizedBox(height: 8),
                                      Text("Goal: ${plan.goal}",
                                          style: const TextStyle(
                                              color: Colors.white)),
                                      Text("Level: ${plan.fitnessLevel}",
                                          style: const TextStyle(
                                              color: Colors.white)),
                                      Text("Type: ${plan.type}",
                                          style: const TextStyle(
                                              color: Colors.white)),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Note: ${plan.note ?? 'No notes'}",
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.white70)),
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .deleteUserHealthProfile(
                                                      plan.id);
                                            },
                                            child: const Text("delete plan",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.white70)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      controller.plans.isEmpty
                          ? ElevatedButton(
                              onPressed: () {
                                Get.to(() => const AddplanUser(),
                                    arguments: {"id": controller.id});
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  foregroundColor: Colors.white),
                              child: const Text("Add new plan"))
                          : const Text(
                              "please delete plan for add new plan ",
                              style: TextStyle(color: Colors.indigo),
                            )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
