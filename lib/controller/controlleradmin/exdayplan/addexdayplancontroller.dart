import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/exerciesmodel.dart';
import 'package:fitnessapp/data/remot/exdayplanremot.dart';
import 'package:fitnessapp/data/remot/exerciesremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExDayPlanController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Exdayplandata exdayplandata = Exdayplandata(Get.find());
  Exercisedata exerciesdata = Exercisedata(Get.find());

  int? planId;
  int? dayId;

  List<Exercisemodel> exercisesList = [];
  int? selectedExerciseId;

  final TextEditingController recommendedRepeatsController =
      TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController restTimeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  getExercises() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await exerciesdata.getExercises(services.shared.getString("token")!);

    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      exercisesList = (response['exercises'] as List)
          .map((e) => Exercisemodel.fromJson(e))
          .toList();
    }
  }

  Future<void> addExerciseToDay() async {
    if (selectedExerciseId == null ||
        recommendedRepeatsController.text.isEmpty) {
      Get.snackbar(
          "Error", "Please choose an exercise and fill required fields.");
      return;
    }

    try {
      final int recommendedRepeats =
          int.parse(recommendedRepeatsController.text);
      final int? sets = setsController.text.isNotEmpty
          ? int.parse(setsController.text)
          : null;
      final int? rest = restTimeController.text.isNotEmpty
          ? int.parse(restTimeController.text)
          : null;

      stateerr = Stateerr.loding;
      update();

      final Map<String, dynamic> data = {
        "exercise_id": selectedExerciseId!.toString(),
        "recommended_repeats": recommendedRepeats.toString(),
        "sets": sets.toString(),
        "rest_time_seconds": rest.toString(),
        "notes": notesController.text.isEmpty ? null : notesController.text,
      };

      var response = await exdayplandata.addexdayPlan(
        data,
        services.shared.getString("token")!,
        planId,
        dayId,
      );

      stateerr = handlingdata(response);
      update();

      if (stateerr == Stateerr.success && response["status"] == 201) {
        Get.back();
      }
    } catch (e) {
      Get.snackbar("Error", "Please enter valid numbers.");
    }
  }

  @override
  void onInit() {
    planId = Get.arguments["planid"];
    dayId = Get.arguments["dayid"];
    getExercises();
    super.onInit();
  }

  @override
  void onClose() {
    recommendedRepeatsController.dispose();
    setsController.dispose();
    restTimeController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
