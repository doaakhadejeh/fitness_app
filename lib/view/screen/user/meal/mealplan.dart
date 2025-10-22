import 'package:fitnessapp/controller/controlleruser/mealplan/mealplancontroller.dart';
import 'package:fitnessapp/view/screen/user/meal/detailsmealplan.dart';
import 'package:fitnessapp/view/screen/user/meal/prmealplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';

class UserMealPlansPage extends StatelessWidget {
  const UserMealPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserMealPlansController());

    return GetBuilder<UserMealPlansController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(" Meal Plans"),
          backgroundColor: Colors.deepPurple[800],
          foregroundColor: Colors.white,
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const UserPrMealPlansPage(),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.only(right: 3, left: 4)),
              child: const Row(
                children: [
                  Icon(Icons.apple),
                  Text(
                    "My plan",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
            // TextButton(
            //     onPressed: () {
            //       Get.to(
            //         () => const UserPrMealPlansPage(),
            //       );
            //     },
            //     child: Text(
            //       "My plan",
            //       style: TextStyle(
            //           backgroundColor: Colors.white,
            //           color: Colors.deepPurple[800]),
            //     ))
            Container(
              width: 10,
            )
          ],
        ),
        body: Handlingdatarequest(
          stateerr: controller.stateerr,
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.mealPlans.length,
            itemBuilder: (context, index) {
              final plan = controller.mealPlans[index];
              return Card(
                elevation: 4,
                surfaceTintColor: Colors.deepPurple[200],
                // color: Colors.deepPurple[50],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  title: Text(plan.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text("Type: ${plan.type}"),
                      if (plan.goal != null) Text("Goal: ${plan.goal}"),
                      if (plan.note != null) Text("Note: ${plan.note}"),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Colors.deepPurple),
                  onTap: () {
                    Get.to(() => const MealPlanUserDetails(),
                        arguments: {"id": plan.id});
                  },
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
