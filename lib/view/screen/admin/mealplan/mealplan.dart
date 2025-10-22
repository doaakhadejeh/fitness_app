import 'package:fitnessapp/controller/controlleradmin/mealplan/mealplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mealplanadmin extends StatelessWidget {
  const Mealplanadmin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Mealplanadmincontroller());

    return GetBuilder<Mealplanadmincontroller>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Meal Plans"),
          foregroundColor: Colors.deepPurple[600],
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                Get.find<Mealplanadmincontroller>().getAllMealPlans();
              },
            ),
          ],
        ),
        body: Handlingdatarequest(
          stateerr: controller.stateerr,
          child: ListView.builder(
            itemCount: controller.mealPlans.length,
            itemBuilder: (context, index) {
              final plan = controller.mealPlans[index];
              return Card(
                color: Colors.deepPurple[50]!.withOpacity(0.7),
                margin: const EdgeInsets.all(10),
                elevation: 3,
                child: ListTile(
                  title: Text(
                    plan.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Type: ${plan.type}"),
                      if (plan.goal != null) Text("Goal: ${plan.goal}"),
                      if (plan.note != null) Text("Note: ${plan.note}"),
                    ],
                  ),
                  trailing: Wrap(
                    spacing: 0,
                    children: [
                      // if (plan.isDefault == 1)
                      //   const Icon(Icons.star, color: Colors.deepPurple),
                      IconButton(
                        icon: const Icon(Icons.info, color: Colors.indigo),
                        onPressed: () {
                          Get.toNamed(Approut.detmealplan, arguments: {
                            'planId': plan.id,
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.deepPurple),
                        onPressed: () {
                          Get.toNamed(Approut.editmealplan, arguments: {
                            'planId': plan.id,
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Delete Meal Plan",
                            middleText:
                                "Are you sure you want to delete this plan?",
                            textCancel: "Cancel",
                            textConfirm: "Delete",
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              controller.deleteMeals(plan.id);
                              Get.back();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // ✅ زر إضافة خطة غذائية
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Approut.addmealplan);
          },
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.deepPurple[50],
          tooltip: "Add Meal Plan",
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
