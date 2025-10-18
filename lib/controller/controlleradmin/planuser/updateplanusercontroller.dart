import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/planemodel.dart';
import 'package:fitnessapp/data/remot/planremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addplanusercontroller extends GetxController {
  Services services = Get.find();
  Plandata remot = Plandata(Get.find());

  Stateerr stateerr = Stateerr.none;
  List<ExercisePlan> allPlans = [];

  late String id;
  int? selectedPlanId;
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  getAllPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response = await remot.getPlans(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      allPlans = (response['plans'] as List)
          .map((e) => ExercisePlan.fromJson(e))
          .toList();
    }
    update();
  }

  assignPlan() async {
    if (selectedPlanId == null) {
      Get.snackbar("Error", "Please select a plan");
      return;
    }

    stateerr = Stateerr.loding;
    update();

    Map<String, dynamic> data = {
      "exercise_plan_id": selectedPlanId.toString(),
      if (startDate.text.isNotEmpty) "start_date": startDate.text,
      if (endDate.text.isNotEmpty) "end_date": endDate.text,
    };

    var response = await remot.addplanuser(
      data,
      services.shared.getString("token")!,
      id,
    );
    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.back(); // ارجع للخلف بعد النجاح
      Get.snackbar("Success", "Plan assigned successfully");
    } else if (response["status"] == 409) {
      Get.snackbar("Warning", response["message"]);
    }

    update();
  }

  @override
  void onInit() {
    id = Get.arguments["id"];
    getAllPlans();
    super.onInit();
  }
}
