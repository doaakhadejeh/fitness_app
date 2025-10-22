import 'package:fitnessapp/controller/controlleradmin/plan/addplanecontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPlan extends StatelessWidget {
  const AddPlan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPlanController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("Add New Plan"),
        titleTextStyle: TextStyle(color: Colors.deepPurple[900]),
        centerTitle: true,
      ),
      body: GetBuilder<AddPlanController>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Create New Plan",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Enter the plan details and click Save",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: controller.title,
                      decoration: const InputDecoration(
                        labelText: "Plan Title",
                        hintText: "Enter the plan title",
                        prefixIcon: Icon(Icons.title, color: Colors.grey),
                      ),
                      validator: (v) => v == null || v.isEmpty
                          ? "This field is required"
                          : null,
                    ),
                    const SizedBox(height: 20),

                    // 🔽 Goal Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Goal",
                        prefixIcon: Icon(Icons.flag, color: Colors.grey),
                      ),
                      value: controller.goal,
                      items: controller.goals
                          .map((val) => DropdownMenuItem(
                                value: val,
                                child:
                                    Text(val.replaceAll("_", " ").capitalize!),
                              ))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) controller.setGoal(val);
                      },
                      validator: (val) => val == null || val.isEmpty
                          ? "This field is required"
                          : null,
                    ),

                    const SizedBox(height: 20),

                    // 🔽 Fitness Level Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Fitness Level",
                        prefixIcon:
                            Icon(Icons.fitness_center, color: Colors.grey),
                      ),
                      value: controller.fitnessLevel,
                      items: controller.levels
                          .map((val) => DropdownMenuItem(
                                value: val,
                                child: Text(val.capitalize!),
                              ))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) controller.setLevel(val);
                      },
                      validator: (val) => val == null || val.isEmpty
                          ? "This field is required"
                          : null,
                    ),

                    const SizedBox(height: 20),

                    // 🔽 Type Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Type",
                        prefixIcon: Icon(Icons.category, color: Colors.grey),
                      ),
                      value: controller.type,
                      items: controller.types
                          .map((val) => DropdownMenuItem(
                                value: val,
                                child: Text(val.capitalize!),
                              ))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) controller.setType(val);
                      },
                      validator: (val) => val == null || val.isEmpty
                          ? "This field is required"
                          : null,
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: controller.note,
                      decoration: const InputDecoration(
                        labelText: "Notes",
                        hintText: "Enter any notes",
                        prefixIcon: Icon(Icons.note, color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔽 Access Type Dropdown
                    // DropdownButtonFormField<String>(
                    //   decoration: const InputDecoration(
                    //     labelText: "Access Type",
                    //     prefixIcon: Icon(Icons.lock_open, color: Colors.grey),
                    //   ),
                    //   value: controller.accessType,
                    //   items: const [
                    //     DropdownMenuItem(
                    //       value: "public",
                    //       child: Text("Public"),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: "private",
                    //       child: Text("private"),
                    //     ),
                    //   ],
                    //   onChanged: (val) {
                    //     if (val != null) controller.setAccessType(val);
                    //   },
                    // ),

                    const SizedBox(height: 20),

                    SwitchListTile(
                      title: const Text("Active"),
                      value: controller.isActive,
                      onChanged: controller.setIsActive,
                    ),

                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: controller.addPlan,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "Save Plan",
                        style: TextStyle(color: Colors.white),
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
