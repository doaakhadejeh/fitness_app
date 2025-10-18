import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/mealgredientremote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMealIngredientController extends GetxController {
  Mealgredientdata mealdata = Mealgredientdata(Get.find());
  Services services = Get.find();

  Stateerr stateerr = Stateerr.none;

  TextEditingController ingredientName = TextEditingController();

  late int mealId;
  late int ingredientId;

  updateIngredient() async {
    stateerr = Stateerr.loding;
    update();

    var response = await mealdata.editmealgr(
      {
        'ingredient_name': ingredientName.text,
      },
      services.shared.getString("token")!,
      mealId,
      ingredientId,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.back();
    }

    update();
  }

  @override
  void onInit() {
    var args = Get.arguments;
    mealId = args['mealId'];
    ingredientId = args['ingredientid'];
    ingredientName.text = args['ingredientname'];
    super.onInit();
  }
}
