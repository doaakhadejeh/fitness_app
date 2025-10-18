import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/auth/signupremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Signupcontroller extends GetxController {
  login();
  sinup();
}

class Signupcontrollerimp extends Signupcontroller {
  Services services = Get.find();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phone;
  late TextEditingController confpass;

  GlobalKey<FormState> f = GlobalKey<FormState>();
  Stateerr stateerr = Stateerr.none;
  bool secpass = true;
  Signupdata signupdata = Signupdata(Get.find());
  List data = [];

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    confpass = TextEditingController();

    super.onInit();
  }

  showpass() {
    secpass = secpass == true ? false : true;
    update();
  }

  @override
  sinup() async {
    var forms = f.currentState;
    if (forms!.validate()) {
      stateerr = Stateerr.loding;
      update();
      var response = await signupdata.postdata(
          email.text, password.text, userName.text, confpass.text, phone.text);
      stateerr = handlingdata(response);
      update();
      if (Stateerr.success == stateerr) {
        if (response is Map &&
            (response["status"] == 201 || response["status"] == 200)) {
          Get.offNamed(Approut.login);
        } else {
          Get.defaultDialog(title: "chang your email", content: const Text(""));
          stateerr = Stateerr.failure;
        }
        update();
      }
      update();
    } else {}
  }

  @override
  login() {
    Get.offNamed(Approut.login);
  }
}
