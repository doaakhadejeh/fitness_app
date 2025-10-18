import 'package:fitnessapp/controller/controlleradmin/meal/editmealcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMealPage extends StatelessWidget {
  const EditMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditMealController());
    return GetBuilder<EditMealController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Meal"),
          backgroundColor: Colors.deepPurple[900],
          foregroundColor: Colors.white,
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildTextField(controller.name, "Meal Name"),
                const SizedBox(height: 15),
                _buildDropdown(controller),
                const SizedBox(height: 15),
                _buildTextField(controller.description, "Description",
                    maxLines: 3),
                const SizedBox(height: 15),
                _buildTextField(controller.quantityGrams, "Quantity (grams)",
                    type: TextInputType.number),
                const SizedBox(height: 15),
                _buildTextField(controller.calories, "Calories",
                    type: TextInputType.number),
                const SizedBox(height: 15),
                _buildTextField(controller.protein, "Protein (g)",
                    type: TextInputType.number),
                const SizedBox(height: 15),
                _buildTextField(controller.carbs, "Carbs (g)",
                    type: TextInputType.number),
                const SizedBox(height: 15),
                _buildTextField(controller.healthyFats, "Healthy Fats (g)",
                    type: TextInputType.number),
                const SizedBox(height: 15),

                // ====== Image Section =======
                const Text("Meal Image",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => controller.chooseImage(),
                  onLongPress: () => controller.removeImage(), // حذف الصورة
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: Colors.deepPurple[800]!, width: 2),
                    ),
                    child: controller.imageFile != null
                        ? Image.file(controller.imageFile!, fit: BoxFit.cover)
                        : controller.oldImage != null
                            ? Image.network(
                                "${Imageconst.imageback}${controller.oldImage}",
                                fit: BoxFit.cover,
                              )
                            : const Center(child: Text("Tap to select image")),
                  ),
                ),

                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[900],
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () => controller.updateMeal(),
                  child: const Text("Save Changes"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1, TextInputType type = TextInputType.text}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDropdown(EditMealController controller) {
    return DropdownButtonFormField<String>(
      value: controller.selectedMealTime,
      decoration: const InputDecoration(
        labelText: "Meal Time",
        border: OutlineInputBorder(),
      ),
      items: controller.mealTimes
          .map((time) => DropdownMenuItem(
                value: time,
                child: Text(time.toUpperCase()),
              ))
          .toList(),
      onChanged: (val) {
        controller.selectedMealTime = val;
      },
    );
  }
}
