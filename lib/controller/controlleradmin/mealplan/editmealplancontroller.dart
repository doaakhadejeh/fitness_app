import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealmodel.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:fitnessapp/data/remot/mealremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMealPlanController extends GetxController {
  Services services = Get.find();
  Mealplandata mealPlanRemote = Mealplandata(Get.find());
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
  late int mealPlanId;

  @override
  void onInit() {
    mealPlanId = Get.arguments['planId'];

    fetchInitialData();
    super.onInit();
  }

  fetchInitialData() async {
    isLoading = true;
    update();

    // Get plan data
    var response = await mealPlanRemote.getdetmealplan(
      services.shared.getString("token")!,
      mealPlanId,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      var data = response['data'];

      title.text = data['title'];
      description.text = data['description'] ?? '';
      note.text = data['note'] ?? '';
      type = data['type'];
      goal = data['goal'];
      isDefault = data['is_default'] == 1;

      selectedMealIds = List<int>.from(
        (data['meals'] as List).map((e) => e['id']),
      );
    }

    // Get all meals for selection
    var responseMeals =
        await mealRemote.getmeal(services.shared.getString("token")!);
    if (handlingdata(responseMeals) == Stateerr.success) {
      allMeals = List<MealModel>.from(
          (responseMeals['data'] as List).map((e) => MealModel.fromJson(e)));
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

  updateMealPlan() async {
    stateerr = Stateerr.loding;
    update();

    // هنا يتم إعداد البيانات بشكل صحيح للإرسال كـ JSON
    // لاحظ أن نوع الـ Map أصبح Map<String, dynamic>
    Map<String, dynamic> data = {
      "title": title.text,
      "type": type,
      "description": description.text,
      "note": note.text,
      // يتم إرسال القيمة البوليانية مباشرة، Laravel سيتعامل معها
      "is_default": isDefault,
      // هذا هو التعديل الأهم: يتم إرسال القائمة مباشرة
      "meal_ids": selectedMealIds,
    };

    if (type == "private" && goal != null) {
      data["goal"] = goal!;
    }

    // تم حذف الحلقة التي كانت تسبب المشكلة، لم نعد بحاجة إليها

    var response = await mealPlanRemote.editmealplan(
      data,
      services.shared.getString("token")!,
      mealPlanId,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.snackbar("Success", "Meal Plan updated successfully");
      Get.offNamed(Approut.mealplan);
    } else {
      Get.snackbar("Error", "Failed to update meal plan");
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
