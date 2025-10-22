import 'dart:io';

import 'package:fitnessapp/controller/controlleradmin/category/editcategoriescontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategoryPage extends StatelessWidget {
  const EditCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String categoryId = Get.arguments["id"];
    Get.put(EditCategoryController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Category"),
        centerTitle: true,
      ),
      body: GetBuilder<EditCategoryController>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.name,
                      decoration: const InputDecoration(
                        labelText: "Category Name",
                        hintText: "Enter category name",
                        prefixIcon: Icon(Icons.category),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        controller.chooseImage();
                      },
                      child: Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: controller.imageFile != null
                            ? ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Image.file(
                                  File(controller
                                      .imageFile!.path), // استخدمي Image.file
                                  fit: BoxFit.cover,
                                  width: 200,
                                ))
                            : const Text(
                                "Tap to select image",
                                style: TextStyle(color: Colors.grey),
                              ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        controller.editCategory(categoryId);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[900],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        "Save Category",
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
