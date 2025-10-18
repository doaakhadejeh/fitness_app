import 'package:fitnessapp/controller/controlleruser/mealplan/prmealplancontroller.dart';
import 'package:fitnessapp/view/screen/user/meal/detailsmealplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';

class UserPrMealPlansPage extends StatelessWidget {
  const UserPrMealPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserPrMealPlansController());

    return GetBuilder<UserPrMealPlansController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("My Meal Plans"),
          backgroundColor: Colors.deepPurple[800],
          foregroundColor: Colors.white,
        ),
        body: Handlingdatarequest(
          stateerr: controller.stateerr,
          child: controller.mealPlans == null
              ? const Center(
                  child: Text("no private meal plan for you"),
                )
              : ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    Card(
                      elevation: 4,
                      color: Colors.deepPurple[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        title: Text(controller.mealPlans!.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),
                            Text("Type: ${controller.mealPlans!.type}"),
                            if (controller.mealPlans!.goal != null)
                              Text("Goal: ${controller.mealPlans!.goal}"),
                            if (controller.mealPlans!.note != null)
                              Text("Note: ${controller.mealPlans!.note}"),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Colors.deepPurple),
                        onTap: () {
                          Get.to(() => const MealPlanUserDetails(),
                              arguments: {"id": controller.mealPlans!.id});
                        },
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
