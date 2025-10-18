import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/helthprofremote.dart';
import 'package:fitnessapp/data/model/healthprofilemodel.dart';

class Updatehelthcontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Helthprofdata helthprofdata = Helthprofdata(Cud());

  // النموذج الحالي للتعديل
  HealthProfileModel? profile;

  // الكنترولات الخاصة بالحقول
  late TextEditingController fullName;
  late TextEditingController age;
  late TextEditingController weight;
  late TextEditingController height;
  late TextEditingController fitnessLevel;
  late TextEditingController goal;
  late TextEditingController gender;
  late TextEditingController fatDistribution;
  late TextEditingController chronicIssues;
  late TextEditingController workoutDays;
  late TextEditingController preferredMeals;

  // الكنترولات الجديدة للقياسات
  late TextEditingController waistCircumference;
  late TextEditingController hipCircumference;
  late TextEditingController chestCircumference;
  late TextEditingController armCircumference;

  @override
  void onInit() {
    profile = Get.arguments["profile"];
    initFields();
    super.onInit();
  }

  void initFields() {
    fullName = TextEditingController(text: profile?.fullName ?? '');
    age = TextEditingController(text: profile?.age?.toString() ?? '');
    weight = TextEditingController(text: profile?.weight?.toString() ?? '');
    height = TextEditingController(text: profile?.height?.toString() ?? '');
    fitnessLevel = TextEditingController(text: profile?.fitnessLevel ?? '');
    goal = TextEditingController(text: profile?.goal ?? '');
    gender = TextEditingController(text: profile?.gender ?? '');
    fatDistribution =
        TextEditingController(text: profile?.fatDistribution ?? '');
    chronicIssues =
        TextEditingController(text: profile?.chronicDiseasesOrInjuries ?? '');
    workoutDays = TextEditingController(
        text: profile?.workoutDaysPerWeek?.toString() ?? '');
    preferredMeals = TextEditingController(
        text: profile?.preferredMealsCount?.toString() ?? '');

    waistCircumference = TextEditingController(
        text: profile?.waistCircumference?.toString() ?? '');
    hipCircumference = TextEditingController(
        text: profile?.hipCircumference?.toString() ?? '');
    chestCircumference = TextEditingController(
        text: profile?.chestCircumference?.toString() ?? '');
    armCircumference = TextEditingController(
        text: profile?.armCircumference?.toString() ?? '');
  }

  updateProfile() async {
    stateerr = Stateerr.loding;
    update();

    final token = services.shared.getString("token");

    Map<String, dynamic> data = {
      "full_name": fullName.text.isNotEmpty ? fullName.text : null,
      "age": age.text.isNotEmpty ? int.parse(age.text).toString() : null,
      "weight":
          weight.text.isNotEmpty ? double.parse(weight.text).toString() : null,
      "height":
          height.text.isNotEmpty ? double.parse(height.text).toString() : null,
      "fitness_level": fitnessLevel.text.isNotEmpty ? fitnessLevel.text : null,
      "goal": goal.text.isNotEmpty ? goal.text : null,
      "gender": gender.text.isNotEmpty ? gender.text : null,
      "fat_distribution":
          fatDistribution.text.isNotEmpty ? fatDistribution.text : null,
      "chronic_diseases_or_injuries":
          chronicIssues.text.isNotEmpty ? chronicIssues.text : null,
      "workout_days_per_week": workoutDays.text.isNotEmpty
          ? int.parse(workoutDays.text).toString()
          : null,
      "preferred_meals_count": preferredMeals.text.isNotEmpty
          ? int.parse(preferredMeals.text).toString()
          : null,

      // القيم الجديدة
      "waist_circumference": waistCircumference.text.isNotEmpty
          ? double.parse(waistCircumference.text).toString()
          : null,
      "hip_circumference": hipCircumference.text.isNotEmpty
          ? double.parse(hipCircumference.text).toString()
          : null,
      "chest_circumference": chestCircumference.text.isNotEmpty
          ? double.parse(chestCircumference.text).toString()
          : null,
      "arm_circumference": armCircumference.text.isNotEmpty
          ? double.parse(armCircumference.text).toString()
          : null,
    };

    data.removeWhere((key, value) => value == null);

    var response = await helthprofdata.updatehelth(token!, data);

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.snackbar("Success", "Updated successfully");
      Get.offNamed(Approut.updatehelth);
    } else {
      Get.snackbar("Error", "Something went wrong");
    }

    update();
  }

  @override
  void onClose() {
    fullName.dispose();
    age.dispose();
    weight.dispose();
    height.dispose();
    fitnessLevel.dispose();
    goal.dispose();
    gender.dispose();
    fatDistribution.dispose();
    chronicIssues.dispose();
    workoutDays.dispose();
    preferredMeals.dispose();

    waistCircumference.dispose();
    hipCircumference.dispose();
    chestCircumference.dispose();
    armCircumference.dispose();

    super.onClose();
  }
}
