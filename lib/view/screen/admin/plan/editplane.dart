import 'package:fitnessapp/controller/controlleradmin/plan/editplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPlan extends StatelessWidget {
  const EditPlan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditPlanController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Plan"),
        centerTitle: true,
      ),
      body: GetBuilder<EditPlanController>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.title,
                      decoration: const InputDecoration(
                        labelText: "Title",
                        hintText: "Enter the plan title",
                        prefixIcon: Icon(Icons.title),
                      ),
                      validator: (v) => v == null || v.isEmpty
                          ? "This field is required"
                          : null,
                    ),
                    const SizedBox(height: 16),
                    // DropdownButtonFormField<String>(
                    //   decoration: const InputDecoration(
                    //     labelText: "Goal",
                    //     prefixIcon: Icon(Icons.flag),
                    //   ),
                    //   value: controller.goal,
                    //   items: controller.goals
                    //       .map((val) => DropdownMenuItem(
                    //             value: val,
                    //             child:
                    //                 Text(val.replaceAll("_", " ").capitalize!),
                    //           ))
                    //       .toList(),
                    //   onChanged: controller.setGoal,
                    //   validator: (val) => val == null || val.isEmpty
                    //       ? "This field is required"
                    //       : null,
                    // ),
                    const SizedBox(height: 16),
                    // DropdownButtonFormField<String>(
                    //   decoration: const InputDecoration(
                    //     labelText: "Fitness Level",
                    //     prefixIcon: Icon(Icons.fitness_center),
                    //   ),
                    //   value: controller.fitnessLevel,
                    //   items: controller.levels
                    //       .map((val) => DropdownMenuItem(
                    //             value: val,
                    //             child: Text(val.capitalize!),
                    //           ))
                    //       .toList(),
                    //   onChanged: controller.setLevel,
                    //   validator: (val) => val == null || val.isEmpty
                    //       ? "This field is required"
                    //       : null,
                    // ),
                    // const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Type",
                        prefixIcon: Icon(Icons.category),
                      ),
                      value: controller.type,
                      items: controller.types
                          .map((val) => DropdownMenuItem(
                                value: val,
                                child: Text(val.capitalize!),
                              ))
                          .toList(),
                      onChanged: controller.setType,
                      validator: (val) => val == null || val.isEmpty
                          ? "This field is required"
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: controller.note,
                      decoration: const InputDecoration(
                        labelText: "Notes",
                        hintText: "Enter any notes",
                        prefixIcon: Icon(Icons.note),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // DropdownButtonFormField<String>(
                    //   decoration: const InputDecoration(
                    //     labelText: "Access Type",
                    //     prefixIcon: Icon(Icons.lock_open),
                    //   ),
                    //   value: controller.accessType,
                    //   items: const [
                    //     DropdownMenuItem(
                    //       value: "public",
                    //       child: Text("Public"),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: "private",
                    //       child: Text("Private"),
                    //     ),
                    //   ],
                    //   onChanged: controller.setAccessType,
                    // ),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        onPressed: controller.editPlan,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
