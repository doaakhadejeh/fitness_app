import 'package:fitnessapp/controller/controlleradmin/plan/planviewcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/view/screen/admin/plan/editplane.dart';
import 'package:fitnessapp/view/screen/admin/plan/viewdayplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlanViewController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise Plans"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.find<PlanViewController>().getPlans();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: GetBuilder<PlanViewController>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: controller.plans.isEmpty
                ? const Center(child: Text("No plans found."))
                : ListView.builder(
                    itemCount: controller.plans.length,
                    itemBuilder: (context, index) {
                      final plan = controller.plans[index];
                      return Card(
                        color: Colors.white.withOpacity(0.9),
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(
                            plan.title,
                            style: TextStyle(
                                color: Colors.deepPurple[900],
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                              ),
                              Text('-plan goal : ${plan.goal}'),
                              Container(
                                height: 4,
                              ),
                              Text("-fitness level : ${plan.fitnessLevel}"),
                              Container(
                                height: 4,
                              ),
                              Text("-note : ${plan.note}"),
                              Container(
                                height: 15,
                              ),
                              Row(
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        backgroundColor:
                                            Colors.deepPurple.shade800,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {
                                        controller
                                            .deleteplan(plan.id.toString());
                                      },
                                      child: const Text(
                                        "delete",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                    height: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        backgroundColor:
                                            Colors.deepPurple.shade800,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(() => const EditPlan(),
                                            arguments: plan);
                                      },
                                      child: const Text(
                                        "edit",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                    height: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        backgroundColor:
                                            Colors.deepPurple.shade800,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(() => const Viewdayplan(),
                                            arguments: {"planid": plan.id});
                                      },
                                      child: const Text(
                                        "day plan",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          trailing: Icon(
                            plan.type == "general" ? Icons.public : Icons.lock,
                            color: Colors.deepPurple[900],
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Approut.addplane);
        },
        backgroundColor: Colors.deepPurple[900],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
