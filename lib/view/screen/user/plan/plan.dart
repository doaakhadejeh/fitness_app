import 'package:fitnessapp/controller/controlleruser/plan/plancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/view/screen/user/plan/generaldayplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Plan extends StatelessWidget {
  const Plan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PLancontroller());
    return GetBuilder<PLancontroller>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.deepPurple[50],
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.offNamed(Approut.home);
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text(
              "Plan For You",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple[50],
          ),
          body: Handlingdataview(
            stateerr: controller.stateerr,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[50],
                              border:
                                  Border.all(color: Colors.deepPurple[700]!)),
                          height: 70,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Approut.prvplan);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Your Plan"),
                                Container(
                                  width: 2,
                                ),
                                const Icon(Icons.timer)
                              ],
                            ),
                          )),
                    ),
                    Container(
                      height: 20,
                    ),
                    const Text(
                      "general plan:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 10,
                    ),
                    Expanded(
                      child: controller.plans.isEmpty
                          ? const Center(
                              child: Text(
                                "No plans available.",
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.plans.length,
                              itemBuilder: (context, i) {
                                final plan = controller.plans[i];
                                return Card(
                                  color: Colors.grey[50],
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                        color: Colors.deepPurple.shade300),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(16),
                                    title: Text(
                                      plan.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          "Goal: ${plan.goal}",
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          "Level: ${plan.fitnessLevel}",
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          "Type: ${plan.type}",
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(
                                      plan.type == "public"
                                          ? Icons.public
                                          : Icons.lock,
                                      color: Colors.deepPurple.shade400,
                                    ),
                                    onTap: () {
                                      Get.to(() => const Generaldayplan(),
                                          arguments: {"planId": plan.id});
                                    },
                                  ),
                                );
                              },
                            ),
                    )
                  ]),
            ),
          ));
    });
  }
}
