import 'package:fitnessapp/controller/controlleradmin/exercies/addexerciescontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExercisePage extends StatelessWidget {
  const AddExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddExerciseController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add Exercise"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple[900],
      ),
      body: GetBuilder<AddExerciseController>(builder: (controller) {
        return Handlingdatarequest(
          stateerr: controller.stateerr,
          child: Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: controller.title,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    prefixIcon: Icon(Icons.title),
                  ),
                  validator: (val) => myvalidat(val!, 3, 100, "title"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.description,
                  decoration: const InputDecoration(
                    labelText: "Description (optional)",
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
                const SizedBox(height: 10),

                // Categories Dropdown
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    labelText: "Category",
                  ),
                  value:
                      controller.categoryId == 0 ? null : controller.categoryId,
                  items: controller.categoriesList.map((category) {
                    return DropdownMenuItem<int>(
                      value: category["id"],
                      child: Text(category["name"]),
                    );
                  }).toList(),
                  onChanged: (val) {
                    controller.setCategoryId(val ?? 0);
                  },
                  validator: (val) {
                    if (val == null || val == 0) {
                      return "Please select a category";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Access Type",
                  ),
                  value: controller.accessType,
                  items: const [
                    DropdownMenuItem(
                      value: "public",
                      child: Text("Public"),
                    ),
                    DropdownMenuItem(
                      value: "private",
                      child: Text("Private"),
                    ),
                  ],
                  onChanged: (val) {
                    controller.setAccessType(val ?? "public");
                  },
                ),
                const SizedBox(height: 10),

                SwitchListTile(
                  title: const Text("Active"),
                  value: controller.isActive,
                  onChanged: (val) {
                    controller.setIsActive(val);
                  },
                ),
                const SizedBox(height: 20),

                // زر اختيار الفيديو
                ElevatedButton.icon(
                  icon: const Icon(Icons.video_library),
                  label: const Text("Pick Video from Device"),
                  onPressed: () {
                    controller.pickVideo();
                  },
                ),
                const SizedBox(height: 10),

                // عرض مسار الفيديو
                if (controller.selectedVideoPath != null)
                  Text(
                    "Selected Video: ${controller.selectedVideoPath}",
                    style: const TextStyle(color: Colors.green),
                  ),

                const SizedBox(height: 70),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                  ),
                  onPressed: () {
                    controller.addExercise();
                  },
                  child: const Text(
                    "Add Exercise",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
