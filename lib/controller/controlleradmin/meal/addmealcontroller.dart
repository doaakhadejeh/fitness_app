import 'dart:io';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/mealremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddMealController extends GetxController {
  Mealdata mealdata = Mealdata(Get.find());
  Services services = Get.find();

  Stateerr stateerr = Stateerr.none;

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController quantityGrams = TextEditingController();
  TextEditingController calories = TextEditingController();
  TextEditingController protein = TextEditingController();
  TextEditingController carbs = TextEditingController();
  TextEditingController healthyFats = TextEditingController();

  List<String> ingredientNames = [];

  String? selectedMealTime;
  final List<String> mealTimes = ['breakfast', 'lunch', 'dinner', 'snack'];

  File? imageFile;

  // ✅ اختيار صورة
  chooseImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageFile = File(picked.path);
      update();
    }
  }

  // ✅ إضافة مكون جديد
  void addIngredient(String name) {
    if (name.trim().isNotEmpty) {
      ingredientNames.add(name.trim());
      update();
    }
  }

  // ✅ حذف مكون
  void removeIngredient(int index) {
    ingredientNames.removeAt(index);
    update();
  }

  // ✅ إنشاء الوجبة
  createMeal() async {
    stateerr = Stateerr.loding;
    update();

    Map<String, dynamic> data = {
      'name': name.text,
      'description': description.text,
      'meal_time': selectedMealTime,
      'quantity_grams': quantityGrams.text,
      'calories': calories.text,
      'protein': protein.text,
      'carbs': carbs.text,
      'healthy_fats': healthyFats.text,
    };

    // هنا نحول قائمة المكونات إلى صيغة يفهمها Laravel كمصفوفة
    for (int i = 0; i < ingredientNames.length; i++) {
      data['ingredients[$i][ingredient_name]'] = ingredientNames[i];
    }

    var response = await mealdata.addmeal(
      data,
      imageFile!,
      services.shared.getString("token")!,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.back();
    }

    update();
  }
}
