import 'package:fitnessapp/controller/controlleradmin/mealplanuser/showmealplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/view/screen/admin/mealplanuser/updateplanmealuser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPlanUserPage extends StatelessWidget {
  const MealPlanUserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MealPlanUserController());

    return GetBuilder<MealPlanUserController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Assigned Meal Plans"),
            centerTitle: true,
            backgroundColor: Colors.deepPurple[800],
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => const EditMealprUser(),
                        arguments: {"id": controller.id.toString()});
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: Handlingdataview(
            stateerr: controller.stateerr,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.plans.length,
              itemBuilder: (context, i) {
                final plan = controller.plans[i];
                return Card(
                  color: Colors.deepPurple[50],
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        controller.deleteplanusermeal(
                            controller.plans[i].id.toString());
                      },
                    ),
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
                        if (plan.note != null) Text("Note: ${plan.note!}"),
                        Text("Type: ${plan.type}"),
                        if (plan.goal != null) Text("Goal: ${plan.goal!}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
