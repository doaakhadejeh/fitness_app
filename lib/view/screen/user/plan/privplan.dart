import 'package:fitnessapp/controller/controlleruser/plan/privplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Privplan extends StatelessWidget {
  const Privplan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Privplancontroller());
    return GetBuilder<Privplancontroller>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.deepPurple[50],
          appBar: AppBar(
            title: const Text(
              "Your plan",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            centerTitle: true,
            backgroundColor: Colors.purple[50],
          ),
          body: Handlingdataview(
            stateerr: controller.stateerr,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: controller.plans.isEmpty
                  ? const Center(
                      child: Text(
                        "No plans available.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ListView.builder(
                        itemCount: controller.plans.length,
                        itemBuilder: (context, i) {
                          final plan = controller.plans[i];
                          return Card(
                            color: Colors.deepPurple[50],
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side:
                                  BorderSide(color: Colors.deepPurple.shade300),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                Get.toNamed(Approut.daygnrplan,
                                    arguments: {"planId": plan.id});
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ));
    });
  }
}
