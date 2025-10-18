import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/data/remot/auth/passwordremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resivepasscontroller extends GetxController {
  late TextEditingController password;
  late TextEditingController compass;
  GlobalKey<FormState> f = GlobalKey<FormState>();

  bool secpass = true;
  String? email;
  Stateerr? stateerr = Stateerr.none;
  Passworddata resetpassworddata = Passworddata(Get.find());
  String code = "";

  showpass() {
    secpass = secpass == true ? false : true;
    update();
  }

  @override
  void onInit() {
    password = TextEditingController();
    compass = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  gotosuccess() async {
    var forms = f.currentState;
    if (forms!.validate()) {
      stateerr = Stateerr.loding;
      update();
      var response = await resetpassworddata.resetpassdata(
          email!, password.text, compass.text, code);
      stateerr = handlingdata(response);
      if (Stateerr.success == stateerr) {
        if (response["status"] == 200 || response["status"] == 201) {
          Get.toNamed(Approut.sucesspass);
        } else if (response["status"] == 400) {
          Get.defaultDialog(
              title: "error", content: const Text("Invalid verification code"));
        } else if (response["status"] == 404) {
          Get.defaultDialog(
              title: "error", content: const Text("user not found"));
        }
      } else {
        Get.defaultDialog(title: "Error", content: const Text(""));
        Get.toNamed(Approut.login);
        stateerr = Stateerr.failure;
      }
      update();
    }
  }

  resend() async {
    await resetpassworddata.resenddata(email!);
  }
}
