import 'package:fitnessapp/controller/controlleradmin/healthprofuser/updateheaithprcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/data/model/healthprofilemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditHealthProfileUser extends StatelessWidget {
  final HealthProfileModel profile;
  final int userId;

  const EditHealthProfileUser(
      {super.key, required this.profile, required this.userId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditHealthProfileUserController());
    controller.initControllers(profile);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Health Profile"),
        centerTitle: true,
      ),
      body: GetBuilder<EditHealthProfileUserController>(builder: (_) {
        return Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                TextField(
                    controller: controller.fullName,
                    decoration: const InputDecoration(labelText: "Full Name")),
                TextField(
                    controller: controller.age,
                    decoration: const InputDecoration(labelText: "Age")),
                TextField(
                    controller: controller.weight,
                    decoration: const InputDecoration(labelText: "Weight")),
                TextField(
                    controller: controller.height,
                    decoration: const InputDecoration(labelText: "Height")),

                // ✅ Goal Dropdown
                DropdownButtonFormField<String>(
                  value: controller.goal.text.isNotEmpty
                      ? controller.goal.text
                      : null,
                  decoration: const InputDecoration(labelText: "Goal"),
                  items: [
                    'lose_weight',
                    'gain_weight',
                    'build_muscle',
                    'stay_fit',
                  ]
                      .map((val) =>
                          DropdownMenuItem(value: val, child: Text(val)))
                      .toList(),
                  onChanged: (val) => controller.goal.text = val ?? '',
                ),

                // ✅ Fitness Level Dropdown
                DropdownButtonFormField<String>(
                  value: controller.fitnessLevel.text.isNotEmpty
                      ? controller.fitnessLevel.text
                      : null,
                  decoration: const InputDecoration(labelText: "Fitness Level"),
                  items: [
                    'beginner',
                    'intermediate',
                    'advanced',
                  ]
                      .map((val) =>
                          DropdownMenuItem(value: val, child: Text(val)))
                      .toList(),
                  onChanged: (val) => controller.fitnessLevel.text = val ?? '',
                ),

                // ✅ Gender Dropdown
                DropdownButtonFormField<String>(
                  value: controller.gender.text.isNotEmpty
                      ? controller.gender.text
                      : null,
                  decoration: const InputDecoration(labelText: "Gender"),
                  items: [
                    'male',
                    'female',
                  ]
                      .map((val) =>
                          DropdownMenuItem(value: val, child: Text(val)))
                      .toList(),
                  onChanged: (val) => controller.gender.text = val ?? '',
                ),

                // ✅ Fat Distribution Dropdown
                DropdownButtonFormField<String>(
                  value: controller.fatDistribution.text.isNotEmpty
                      ? controller.fatDistribution.text
                      : null,
                  decoration:
                      const InputDecoration(labelText: "Fat Distribution"),
                  items: [
                    'abdomen',
                    'thighs',
                    'arms',
                    'hips',
                    'general',
                  ]
                      .map((val) =>
                          DropdownMenuItem(value: val, child: Text(val)))
                      .toList(),
                  onChanged: (val) =>
                      controller.fatDistribution.text = val ?? '',
                ),

                TextField(
                    controller: controller.chronicDiseases,
                    decoration:
                        const InputDecoration(labelText: "Chronic Issues")),
                TextField(
                    controller: controller.waist,
                    decoration: const InputDecoration(
                        labelText: "Waist Circumference")),
                TextField(
                    controller: controller.hip,
                    decoration:
                        const InputDecoration(labelText: "Hip Circumference")),
                TextField(
                    controller: controller.chest,
                    decoration: const InputDecoration(
                        labelText: "Chest Circumference")),
                TextField(
                    controller: controller.arm,
                    decoration:
                        const InputDecoration(labelText: "Arm Circumference")),
                TextField(
                    controller: controller.workoutDays,
                    decoration: const InputDecoration(
                        labelText: "Workout Days per Week")),

                // ✅ Preferred Meals Count Dropdown
                DropdownButtonFormField<String>(
                  value: controller.preferredMeals.text.isNotEmpty
                      ? controller.preferredMeals.text
                      : null,
                  decoration:
                      const InputDecoration(labelText: "Preferred Meals Count"),
                  items: [
                    '2',
                    '3',
                    '4',
                    '5',
                  ]
                      .map((val) =>
                          DropdownMenuItem(value: val, child: Text(val)))
                      .toList(),
                  onChanged: (val) =>
                      controller.preferredMeals.text = val ?? '',
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.updateHealth(userId);
                  },
                  child: const Text("Update"),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
