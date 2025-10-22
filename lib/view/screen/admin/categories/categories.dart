import 'package:fitnessapp/controller/controlleradmin/category/categoriescontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainerCategoriesPage extends StatelessWidget {
  const TrainerCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise Categories",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Get.find<CategoriesAController>().getCategories();
            },
          ),
        ],
      ),
      body: GetBuilder<CategoriesAController>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          child: Image.network(
                            '${Imageconst.imageback}${category["image"]}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category["name"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.green),
                            onPressed: () {
                              Get.toNamed(
                                Approut.editcat,
                                arguments: {"id": category["id"].toString()},
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              Get.defaultDialog(
                                title: "Delete Category",
                                content: const Text(
                                  "Are you sure you want to delete this category?",
                                ),
                                textCancel: "Cancel",
                                textConfirm: "Delete",
                                onConfirm: () {
                                  controller.deleteCategories(category["id"]);
                                  Get.back();
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[900],
        onPressed: () {
          Get.toNamed(Approut.addcat);
        },
        child: Icon(
          Icons.add,
          color: Colors.purple[50],
        ),
      ),
    );
  }
}
