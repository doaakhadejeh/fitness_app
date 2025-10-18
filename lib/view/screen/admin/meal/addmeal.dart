import 'package:fitnessapp/controller/controlleradmin/meal/addmealcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMealPage extends StatelessWidget {
  const AddMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddMealController());
    return GetBuilder<AddMealController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Meal"),
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

                // 🧂 قسم المكونات
                const SizedBox(height: 10),
                const Text("Ingredients",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _buildIngredientInput(controller),

                const SizedBox(height: 20),
                _buildImagePicker(controller),

                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[900],
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () => controller.createMeal(),
                  child: const Text("Create Meal"),
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

  Widget _buildDropdown(AddMealController controller) {
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

  Widget _buildIngredientInput(AddMealController controller) {
    TextEditingController ingredientController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: ingredientController,
                decoration: const InputDecoration(
                  labelText: "New Ingredient",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[900],
                  foregroundColor: Colors.white),
              onPressed: () {
                controller.addIngredient(ingredientController.text);
                ingredientController.clear();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.ingredientNames.length,
          itemBuilder: (context, index) {
            final ingredient = controller.ingredientNames[index];
            return ListTile(
              title: Text(ingredient),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.removeIngredient(index),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildImagePicker(AddMealController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Meal Image", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => controller.chooseImage(),
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.deepPurple[800]!, width: 2),
            ),
            child: controller.imageFile != null
                ? Image.file(controller.imageFile!, fit: BoxFit.cover)
                : const Center(child: Text("Tap to select image")),
          ),
        ),
      ],
    );
  }
}
