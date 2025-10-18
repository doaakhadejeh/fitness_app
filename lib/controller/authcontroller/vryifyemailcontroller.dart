import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/data/remot/auth/verifyemailremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verifiemailcontroller extends GetxController {
  String? email;

  Stateerr? stateerr = Stateerr.none;
  Verifyemaildata very = Verifyemaildata(Get.find());

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }

  gotosuccess(String verify) async {
    stateerr = Stateerr.loding;
    update();
    var response = await very.postdata(email!, verify);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      if (response["status"] == 200 || response["status"] == 201) {
        Get.offNamed(Approut.sucesssign);
      } else if (response["status"] == 404) {
        Get.defaultDialog(
            title: "error", content: const Text("email not found"));
      }
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      Get.offNamed(Approut.login);
      stateerr = Stateerr.failure;
    }
    update();
  }

  resend() async {
    await very.resenddata(email!);
  }
}
