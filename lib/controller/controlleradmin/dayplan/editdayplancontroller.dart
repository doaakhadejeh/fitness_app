import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/dayplanremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Editdayplancontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Dayplandata dayplandata = Dayplandata(Get.find());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController dayNumber;
  late TextEditingController description;

  late int dayId;
  late int planId;

  @override
  void onInit() {
    var args = Get.arguments;
    dayId = args["dayid"];
    planId = args["planid"];
    dayNumber = TextEditingController(text: args["day_number"].toString());
    description = TextEditingController(text: args["description"] ?? "");
    super.onInit();
  }

  @override
  void dispose() {
    dayNumber.dispose();
    description.dispose();
    super.dispose();
  }

  editDay() async {
    var form = formKey.currentState;
    if (form!.validate()) {
      stateerr = Stateerr.loding;
      update();

      Map<String, dynamic> data = {
        "day_number": dayNumber.text,
        "description": description.text,
      };

      var response = await dayplandata.editdayPlan(
        data,
        services.shared.getString("token")!,
        dayId,
      );

      stateerr = handlingdata(response);
      update();

      if (stateerr == Stateerr.success) {
        Get.offAllNamed(Approut.dayplan, arguments: {
          "planid": planId,
        });
      } else {
        Get.defaultDialog(
          title: "Error",
          content: const Text("Failed to edit day."),
        );
      }
    }
  }
}
