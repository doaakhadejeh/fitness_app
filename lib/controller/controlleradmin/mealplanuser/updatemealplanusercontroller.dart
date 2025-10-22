import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealplanmodel.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMealUserController extends GetxController {
  late TextEditingController startDate;
  late TextEditingController endDate;
  int? selectedMealPlanId;
  late String id;
  Services services = Get.find();
  List<MealPlanModel> mealPlans = [];

  Stateerr stateerr = Stateerr.none;
  Mealplandata remote = Mealplandata(Get.find());

  @override
  void onInit() {
    id = Get.arguments["id"];
    getAllMealPlans();
    startDate = TextEditingController();
    endDate = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    startDate.dispose();
    endDate.dispose();
    super.dispose();
  }

  getAllMealPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response = await remote.getmealplan(
      services.shared.getString("token")!,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      if (response['data'] == null) {
        mealPlans = [];
      } else {
        mealPlans = List<MealPlanModel>.from(
          (response['data'] as List).map((e) => MealPlanModel.fromJson(e)),
        );
      }
    }

    update();
  }

  assignMealPlan() async {
    stateerr = Stateerr.loding;
    update();

    Map<String, dynamic> data = {
      "meal_plan_id": selectedMealPlanId.toString(),
      "start_date": startDate.text,
      "end_date": endDate.text,
    };

    var response = await remote.addmealplanuser(
      data,
      services.shared.getString("token")!,
      id,
    );
    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      if (response['status'] == 201) {
        Get.back();
        Get.snackbar("Success", response['message']);
      } else {
        Get.snackbar("Warning", response['message']);
      }
    }
    update();
  }
}
