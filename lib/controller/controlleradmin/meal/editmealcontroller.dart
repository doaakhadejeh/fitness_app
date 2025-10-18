import 'dart:io';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/mealremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditMealController extends GetxController {
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

  String? selectedMealTime;
  File? imageFile;
  String? oldImage;

  late int mealId;
  final List<String> mealTimes = ['breakfast', 'lunch', 'dinner', 'snack'];

  // ✅ قائمة المكونات
  List<String> ingredientNames = [];

  @override
  void onInit() {
    Map data = Get.arguments;
    final meal = data['meal'];
    mealId = meal['id'];
    name.text = meal['name'];
    description.text = meal['description'] ?? '';
    selectedMealTime = meal['meal_time'];
    oldImage = meal['image_path'];

    quantityGrams.text = (meal['quantity_grams'] ?? '').toString();
    calories.text = (meal['calories'] ?? '').toString();
    protein.text = (meal['protein'] ?? '').toString();
    carbs.text = (meal['carbs'] ?? '').toString();
    healthyFats.text = (meal['healthy_fats'] ?? '').toString();

    // لو المكونات جاية من الـ API، نعبيها
    if (meal['ingredients'] != null) {
      ingredientNames = List<String>.from(
        meal['ingredients'].map((e) => e['ingredient_name']),
      );
    }

    super.onInit();
  }

  chooseImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageFile = File(picked.path);
      oldImage = null;
      update();
    }
  }

  removeImage() {
    imageFile = null;
    oldImage = null;
    update();
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

  updateMeal() async {
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

    // ✅ إرسال المكونات بصيغة يفهمها Laravel
    for (int i = 0; i < ingredientNames.length; i++) {
      data['ingredients[$i][ingredient_name]'] = ingredientNames[i];
    }

    // إذا المستخدم حذف الصورة
    if (imageFile == null && oldImage == null) {
      data['image_path'] = null;
    }

    var response = await mealdata.editmeal(
      data,
      imageFile,
      services.shared.getString("token")!,
      mealId,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.back();
    }

    update();
  }
}
