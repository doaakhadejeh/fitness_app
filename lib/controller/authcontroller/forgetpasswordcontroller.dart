import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/data/remot/auth/passwordremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpasscontroller extends GetxController {
  late TextEditingController email;
  GlobalKey<FormState> f = GlobalKey<FormState>();
  Stateerr? stateerr = Stateerr.none;
  Passworddata passworddata = Passworddata(Get.find());

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  veryfiypass() async {
    var forms = f.currentState;

    if (forms!.validate()) {
      stateerr = Stateerr.loding;
      update();
      var response = await passworddata.forgetpassdata(email.text);
      stateerr = handlingdata(response);
      if (Stateerr.success == stateerr) {
        if (response["status"] == 200) {
          Get.toNamed(Approut.resivepass, arguments: {"email": email.text});
        } else if (response["status"] == 404) {
          Get.defaultDialog(
              title: "error", content: const Text("user not found"));
        }
      } else {
        Get.defaultDialog(title: "error", content: const Text(""));
        stateerr = Stateerr.failure;
      }
      update();
    }
  }
}
