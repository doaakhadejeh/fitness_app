import 'package:fitnessapp/controller/controlleradmin/healthprofuser/showhealthprcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/data/model/healthprofilemodel.dart';
import 'package:fitnessapp/view/screen/admin/helthprofileuser/updatehealthpr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowHealthProfileUser extends StatelessWidget {
  final int userId;

  const ShowHealthProfileUser({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    Get.put(HealthProfileAdminController()).getUserHealthProfile(userId);

    return GetBuilder<HealthProfileAdminController>(builder: (controller) {
      late final HealthProfileModel profile;
      if (controller.profile != null) {
        profile = controller.profile!;
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text("Health Profile"),
          centerTitle: true,
        ),
        body: Handlingdatarequest(
          stateerr: controller.stateerr,
          child: controller.profile == null
              ? const Center(
                  child: Text("no profile helth"),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Text("Full Name: ${profile.fullName ?? 'N/A'}"),
                      const Divider(),
                      Text("Age: ${profile.age ?? 'N/A'}"),
                      const Divider(),
                      Text("Gender: ${profile.gender ?? 'N/A'}"),
                      const Divider(),
                      Text("Weight: ${profile.weight ?? 'N/A'} kg"),
                      const Divider(),
                      Text("Height: ${profile.height ?? 'N/A'} cm"),
                      const Divider(),
                      Text("Fitness Level: ${profile.fitnessLevel ?? 'N/A'}"),
                      const Divider(),
                      Text("Goal: ${profile.goal ?? 'N/A'}"),
                      const Divider(),
                      Text(
                          "Fat Distribution: ${profile.fatDistribution ?? 'N/A'}"),
                      const Divider(),
                      Text(
                          "Diseases/Injuries: ${profile.chronicDiseasesOrInjuries ?? 'N/A'}"),
                      const Divider(),
                      Text(
                          "Workout Days/Week: ${profile.workoutDaysPerWeek ?? 'N/A'}"),
                      const Divider(),
                      Text(
                          "Preferred Meals: ${profile.preferredMealsCount ?? 'N/A'}"),
                      const Divider(),
                      const SizedBox(height: 20),
                      const Text(
                        "Body Measurements:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                          "- Waist: ${profile.waistCircumference ?? 'N/A'} cm"),
                      Text("- Hip: ${profile.hipCircumference ?? 'N/A'} cm"),
                      Text(
                          "- Chest: ${profile.chestCircumference ?? 'N/A'} cm"),
                      Text("- Arm: ${profile.armCircumference ?? 'N/A'} cm"),
                      const SizedBox(height: 20),
                      const Divider(),
                      Text(
                        "Last Updated: ${profile.lastUpdatedAt?.toLocal().toString() ?? 'N/A'}",
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                      const Divider(),
                      IconButton(
                        onPressed: () {
                          Get.to(() => EditHealthProfileUser(
                              profile: profile, userId: userId));
                        },
                        icon: Icon(Icons.edit, color: Colors.deepPurple[600]),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.deleteUserHealthProfile(userId);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
