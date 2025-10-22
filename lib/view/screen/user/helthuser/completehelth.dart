import 'package:fitnessapp/controller/controlleruser/helthcontroller/completehelthcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Completehelth extends StatelessWidget {
  const Completehelth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Completehelthcontroller());
    return GetBuilder<Completehelthcontroller>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Complete Health Profile",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple[900],
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: controller.isComplete == null
              ? const Center(child: CircularProgressIndicator())
              : controller.isComplete == true
                  ? const Center(
                      child: Text("Your profile is already complete ✅"),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            "Please complete the following fields:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView(
                              children: controller.missingFields!.map((field) {
                                final label =
                                    field.replaceAll("_", " ").capitalize!;
                                final options = _getEnumOptions(field);
                                if (options != null) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: label,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      items: options
                                          .map((value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(value.capitalize!),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        controller.updateField(field, value!);
                                      },
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: label,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      keyboardType: _getKeyboardType(field),
                                      onChanged: (value) {
                                        controller.updateField(field, value);
                                      },
                                    ),
                                  );
                                }
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller.submitUpdatedFields();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple[900],
                              ),
                              child: const Text("Submit Updates"),
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      );
    });
  }

  /// Helper function to get dropdown values for enum fields
  List<String>? _getEnumOptions(String field) {
    switch (field) {
      case "fitness_level":
        return ['beginner', 'intermediate', 'advanced'];
      case "goal":
        return ['lose_weight', 'gain_weight', 'build_muscle', 'stay_fit'];
      case "gender":
        return ['male', 'female'];
      case "fat_distribution":
        return ['abdomen', 'thighs', 'arms', 'hips', 'general'];
      case "preferred_meals_count":
        return ['2', '3', '4', '5'];
      default:
        return null;
    }
  }

  /// Helper function to suggest correct input type for fields
  TextInputType _getKeyboardType(String field) {
    if (field.contains("age") ||
        field.contains("weight") ||
        field.contains("circumference") ||
        field.contains("days") ||
        field.contains("count") ||
        field.contains("height")) {
      return TextInputType.number;
    }
    return TextInputType.text;
  }
}
