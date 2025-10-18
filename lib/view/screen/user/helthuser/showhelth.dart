import 'package:fitnessapp/controller/controlleruser/helthcontroller/showhelthcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Showhelth extends StatelessWidget {
  const Showhelth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Showhelthcontroller());

    return GetBuilder<Showhelthcontroller>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Health Profile"),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Colors.purple[900],
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: controller.profileData == null
              ? const Center(child: Text("No Data Found"))
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildInfoCard(
                        "Full Name", controller.profileData!.fullName ?? "-"),
                    _buildInfoCard(
                        "Age", controller.profileData!.age?.toString() ?? "-"),
                    _buildInfoCard("Weight",
                        "${controller.profileData!.weight ?? '-'} kg"),
                    _buildInfoCard("Height",
                        "${controller.profileData!.height ?? '-'} cm"),
                    _buildInfoCard("Fitness Level",
                        controller.profileData!.fitnessLevel ?? "-"),
                    _buildInfoCard("Goal", controller.profileData!.goal ?? "-"),
                    _buildInfoCard(
                        "Gender", controller.profileData!.gender ?? "-"),
                    _buildInfoCard(
                        "Workout Days",
                        controller.profileData!.workoutDaysPerWeek
                                ?.toString() ??
                            "-"),
                    _buildInfoCard("Fat Distribution",
                        controller.profileData!.fatDistribution ?? "-"),
                    _buildInfoCard(
                        "Chronic Issues",
                        controller.profileData!.chronicDiseasesOrInjuries ??
                            "-"),
                    Container(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Approut.updatehelth,
                              arguments: {"profile": controller.profileData});
                        },
                        child: Text(
                          "update data",
                          style: TextStyle(color: Colors.deepPurple[800]),
                        ))
                  ],
                ),
        ),
      );
    });
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        leading: const Icon(Icons.favorite_border),
      ),
    );
  }
}
