import 'package:fitnessapp/controller/controlleruser/helthcontroller/updatehelthcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';

class Updatehelth extends StatelessWidget {
  const Updatehelth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Updatehelthcontroller());
    return GetBuilder<Updatehelthcontroller>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Health Profile",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple[900],
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _buildField("Full Name", controller.fullName),
                _buildField("Age", controller.age, isNumber: true),
                _buildField("Weight (kg)", controller.weight, isNumber: true),
                _buildField("Height (cm)", controller.height, isNumber: true),

                // القياسات الجديدة
                _buildField(
                    "Waist Circumference (cm)", controller.waistCircumference,
                    isNumber: true),
                _buildField(
                    "Hip Circumference (cm)", controller.hipCircumference,
                    isNumber: true),
                _buildField(
                    "Chest Circumference (cm)", controller.chestCircumference,
                    isNumber: true),
                _buildField(
                    "Arm Circumference (cm)", controller.armCircumference,
                    isNumber: true),

                _buildDropdown(
                  label: "Fitness Level",
                  controller: controller.fitnessLevel,
                  options: ["beginner", "intermediate", "advanced"],
                ),
                _buildDropdown(
                  label: "Goal",
                  controller: controller.goal,
                  options: [
                    "lose_weight",
                    "gain_weight",
                    "build_muscle",
                    "stay_fit"
                  ],
                ),
                _buildDropdown(
                  label: "Gender",
                  controller: controller.gender,
                  options: ["male", "female"],
                ),
                _buildDropdown(
                  label: "Fat Distribution",
                  controller: controller.fatDistribution,
                  options: ["abdomen", "thighs", "arms", "hips", "general"],
                ),
                _buildField("Chronic Issues", controller.chronicIssues),
                _buildField("Workout Days/Week", controller.workoutDays,
                    isNumber: true),
                _buildDropdown(
                  label: "Preferred Meals Count",
                  controller: controller.preferredMeals,
                  options: ["2", "3", "4", "5"],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[900],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => controller.updateProfile(),
                  child: const Text("Update", style: TextStyle(fontSize: 18)),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required TextEditingController controller,
    required List<String> options,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: options.contains(controller.text) ? controller.text : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        items: options
            .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.capitalizeFirst!),
                ))
            .toList(),
        onChanged: (value) {
          controller.text = value!;
        },
      ),
    );
  }
}
