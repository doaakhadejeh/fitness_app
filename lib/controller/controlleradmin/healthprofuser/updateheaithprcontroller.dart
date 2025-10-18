import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/healthprofilemodel.dart';
import 'package:fitnessapp/data/remot/helthprofremote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditHealthProfileUserController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Helthprofdata trainercontroldata = Helthprofdata(Get.find());

  late TextEditingController fullName;
  late TextEditingController age;
  late TextEditingController weight;
  late TextEditingController height;
  late TextEditingController goal;
  late TextEditingController fitnessLevel;
  late TextEditingController gender;
  late TextEditingController fatDistribution;
  late TextEditingController chronicDiseases;
  late TextEditingController waist;
  late TextEditingController hip;
  late TextEditingController chest;
  late TextEditingController arm;
  late TextEditingController workoutDays;
  late TextEditingController preferredMeals;

  HealthProfileModel? profile;

  initControllers(HealthProfileModel model) {
    fullName = TextEditingController(text: model.fullName ?? "");
    age = TextEditingController(text: model.age?.toString() ?? "");
    weight = TextEditingController(text: model.weight?.toString() ?? "");
    height = TextEditingController(text: model.height?.toString() ?? "");
    goal = TextEditingController(text: model.goal ?? "");
    fitnessLevel = TextEditingController(text: model.fitnessLevel ?? "");
    gender = TextEditingController(text: model.gender ?? "");
    fatDistribution = TextEditingController(text: model.fatDistribution ?? "");
    chronicDiseases =
        TextEditingController(text: model.chronicDiseasesOrInjuries ?? "");
    waist =
        TextEditingController(text: model.waistCircumference?.toString() ?? "");
    hip = TextEditingController(text: model.hipCircumference?.toString() ?? "");
    chest =
        TextEditingController(text: model.chestCircumference?.toString() ?? "");
    arm = TextEditingController(text: model.armCircumference?.toString() ?? "");
    workoutDays =
        TextEditingController(text: model.workoutDaysPerWeek?.toString() ?? "");
    preferredMeals = TextEditingController(
        text: model.preferredMealsCount?.toString() ?? "");
  }

  updateHealth(int userId) async {
    stateerr = Stateerr.loding;
    update();

    Map data = {
      "full_name": fullName.text,
      "age": age.text,
      "weight": weight.text,
      "height": height.text,
      "goal": goal.text,
      "fitness_level": fitnessLevel.text,
      "gender": gender.text,
      "fat_distribution": fatDistribution.text,
      "chronic_diseases_or_injuries": chronicDiseases.text,
      "waist_circumference": waist.text,
      "hip_circumference": hip.text,
      "chest_circumference": chest.text,
      "arm_circumference": arm.text,
      "workout_days_per_week": workoutDays.text,
      "preferred_meals_count": preferredMeals.text,
    };

    data.removeWhere((key, value) => value == "");

    var response = await trainercontroldata.updatehelthadmin(
        services.shared.getString("token")!, userId, data);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      Get.back(); // رجوع بعد التحديث
    }
    update();
  }
}
