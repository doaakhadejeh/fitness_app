import 'package:fitnessapp/controller/controlleradmin/category/addcategorieacontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryPage extends StatelessWidget {
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCategoryController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("Add Category"),
        titleTextStyle: TextStyle(color: Colors.deepPurple[900]),
        centerTitle: true,
      ),
      body: GetBuilder<AddCategoryController>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: Form(
              key: controller.formKey,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Create New Category",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Enter the category name and save it",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: controller.name,
                      decoration: const InputDecoration(
                        labelText: 'Category Name',
                        hintText: 'Enter category name',
                        prefixIcon: Icon(
                          Icons.category_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (val) {
                        return myvalidat(val!, 2, 50, "name");
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.chooseImage();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 90,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "chooseImage",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        controller.addCategory();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "Save",
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
