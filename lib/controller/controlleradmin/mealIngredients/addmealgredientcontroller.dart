import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/mealgredientremote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMealIngredientController extends GetxController {
  Mealgredientdata mealdata = Mealgredientdata(Get.find());
  Services services = Get.find();

  Stateerr stateerr = Stateerr.none;
  TextEditingController ingredientName = TextEditingController();

  late int mealId;

  addIngredient() async {
    stateerr = Stateerr.loding;
    update();

    var response = await mealdata.addmealgr(
      {
        'ingredient_name': ingredientName.text,
      },
      services.shared.getString("token")!,
      mealId,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.back();
    }

    update();
  }

  @override
  void onInit() {
    mealId = Get.arguments['mealId'];
    super.onInit();
  }
}
