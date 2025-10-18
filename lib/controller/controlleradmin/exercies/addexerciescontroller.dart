import 'dart:io';

import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/categoriesremot.dart';
import 'package:fitnessapp/data/remot/exerciesremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class AddExerciseController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Stateerr stateerr = Stateerr.none;

  Services services = Get.find();
  Exercisedata exerciesdata = Exercisedata(Get.find());
  Categoriesdata categoriesdata = Categoriesdata(Get.find());

  // Controllers
  late TextEditingController title;
  late TextEditingController description;

  // Category ID
  int categoryId = 0;

  // Access Type
  String accessType = "public";

  // Active status
  bool isActive = true;

  // قائمة الفئات
  List categoriesList = [];

  // رابط الفيديو
  File? selectedVideoPath;

  @override
  void onInit() {
    title = TextEditingController();
    description = TextEditingController();
    getCategories();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  getCategories() async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await categoriesdata.getCategories(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      categoriesList = response["categories"];
    }
  }

  // اختيار الفيديو من الجهاز
  Future<void> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null && result.files.single.path != null) {
      selectedVideoPath = File(result.files.single.path!);

      update();
    } else {
      Get.snackbar("Error", "No video selected.");
    }
  }

  // تعيين Category
  void setCategoryId(int id) {
    categoryId = id;
    update();
  }

  // تعيين Access Type
  void setAccessType(String type) {
    accessType = type;
    update();
  }

  // تعيين Active
  void setIsActive(bool value) {
    isActive = value;
    update();
  }

  // إضافة التمرين كامل
  addExercise() async {
    var form = formKey.currentState;
    if (form!.validate()) {
      if (selectedVideoPath == null) {
        Get.defaultDialog(
          title: "Error",
          content: const Text("Please select a video."),
        );
        return;
      }

      stateerr = Stateerr.loding;
      update();

      Map<String, dynamic> data = {
        "title": title.text,
        "exercise_category_id": categoryId.toString(),
        "description": description.text,
        "access_type": accessType,
        "is_active": isActive ? "1" : "0",
      };

      var response = await exerciesdata.addExercise(
        data,
        selectedVideoPath!,
        services.shared.getString("token")!,
      );

      stateerr = handlingdata(response);
      update();

      if (stateerr == Stateerr.success) {
        // Get.offAllNamed(Approut.exercies);
        Get.back();
      } else {
        Get.defaultDialog(
          title: "Error",
          content: const Text("Failed to add exercise."),
        );
      }
    }
  }
}
