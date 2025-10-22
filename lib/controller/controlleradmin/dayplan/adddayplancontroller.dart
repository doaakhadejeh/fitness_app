import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/dayplanremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adddayplancontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Dayplandata dayplandata = Dayplandata(Get.find());

  // Form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers
  late TextEditingController dayNumber;
  late TextEditingController description;

  // ID للخطة
  int? planId;

  @override
  void onInit() {
    planId = Get.arguments["planid"];
    dayNumber = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    dayNumber.dispose();
    description.dispose();
    super.dispose();
  }

  addDay() async {
    var form = formKey.currentState;
    if (form!.validate()) {
      stateerr = Stateerr.loding;
      update();

      Map<String, dynamic> data = {
        "day_number": dayNumber.text,
        "description": description.text,
      };

      var response = await dayplandata.adddayPlan(
        data,
        services.shared.getString("token")!,
        planId!,
      );

      stateerr = handlingdata(response);
      update();

      if (stateerr == Stateerr.success) {
        Get.offNamed(Approut.dayplan, arguments: {
          "planid": planId,
        });
      } else {
        Get.defaultDialog(
          title: "Error",
          content: const Text("Failed to add day."),
        );
      }
    }
  }
}
