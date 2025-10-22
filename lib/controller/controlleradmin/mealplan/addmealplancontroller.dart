import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealmodel.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:fitnessapp/data/remot/mealremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMealPlanController extends GetxController {
  Services services = Get.find();
  Mealplandata mealplanRemote = Mealplandata(Get.find());
  Mealdata mealRemote = Mealdata(Get.find());

  Stateerr stateerr = Stateerr.none;

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController note = TextEditingController();

  String type = "general";
  String? goal;
  bool isDefault = false;

  List<MealModel> allMeals = [];
  List<int> selectedMealIds = [];

  bool isLoading = false;

  @override
  void onInit() {
    fetchAllMeals();
    super.onInit();
  }

  fetchAllMeals() async {
    isLoading = true;
    update();

    var response =
        await mealRemote.getmeal(services.shared.getString("token")!);

    if (handlingdata(response) == Stateerr.success) {
      allMeals = List<MealModel>.from(
          (response['data'] as List).map((e) => MealModel.fromJson(e)));
    }

    isLoading = false;
    update();
  }

  void toggleMealSelection(int id) {
    if (selectedMealIds.contains(id)) {
      selectedMealIds.remove(id);
    } else {
      selectedMealIds.add(id);
    }
    update();
  }

  addMealPlan() async {
    stateerr = Stateerr.loding;
    update();

    Map<String, String> data = {
      "title": title.text,
      "type": type,
      "description": description.text,
      "note": note.text,
      "is_default": isDefault ? '1' : '0',
    };

    if (type == "private" && goal != null) {
      data["goal"] = goal!;
    }

    // Add meal_ids as array-style fields
    for (int i = 0; i < selectedMealIds.length; i++) {
      data["meal_ids[$i]"] = selectedMealIds[i].toString();
    }

    var response = await mealplanRemote.addmealplan(
      data,
      services.shared.getString("token")!,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.snackbar("Success", "Meal Plan Created Successfully");
      Get.offNamed(Approut.mealplan);
    } else {
      Get.snackbar("Error", "Failed to create meal plan");
    }

    update();
  }

  @override
  void onClose() {
    title.dispose();
    description.dispose();
    note.dispose();
    super.onClose();
  }
}
