import 'dart:io';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/categoriesremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditCategoryController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Stateerr stateerr = Stateerr.none;

  Services services = Get.find();
  Categoriesdata categoriesdata = Categoriesdata(Get.find());
  File? imageFile;
  late TextEditingController name;

  @override
  void onInit() {
    name = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  chooseImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageFile = File(picked.path);
      update();
    }
  }

  editCategory(String id) async {
    var form = formKey.currentState;
    if (form!.validate()) {
      stateerr = Stateerr.loding;
      update();

      var response = await categoriesdata.editCategory({"name": name.text},
          imageFile, services.shared.getString("token")!, id);

      stateerr = handlingdata(response);

      update();

      if (stateerr == Stateerr.success) {
        Get.offNamed(Approut.categories);
      } else {
        Get.defaultDialog(
            title: "Error", content: const Text("Failed to update category."));
      }
    }
  }
}
