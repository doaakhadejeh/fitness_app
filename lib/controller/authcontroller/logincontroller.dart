//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/auth/loginremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Logincontroller extends GetxController {
  login();
  gotosignup();
  forgetass();
}

class Logincontrollerimp extends Logincontroller {
  Services services = Get.find();

  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> f = GlobalKey<FormState>();
  Stateerr stateerr = Stateerr.none;
  bool secpass = true;
  Logindata logindata = Logindata(Get.find());
  List data = [];

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  showpass() {
    secpass = secpass == true ? false : true;
    update();
  }

  @override
  gotosignup() {
    Get.offAllNamed(Approut.signup);
  }

  @override
  login() async {
    var forms = f.currentState;
    if (forms!.validate()) {
      stateerr = Stateerr.loding;
      update();
      // print("==========================اثمممممممخخخخخ مخخاا");

      var response = await logindata.postdata(email.text, password.text);
      // print("==========================$response");
      stateerr = handlingdata(response);
      // print("State after handlingdata: $stateerr");
      update();
      if (stateerr == Stateerr.success) {
        if (response["status"] == 200 || response["status"] == 201) {
          if (response["user"]["is_approved"] == true) {
            // حفظ البيانات
            services.shared.setString("id", response["user"]["id"].toString());
            services.shared.setString("name", response["user"]["name"]);
            services.shared.setString("email", response["user"]["email"]);
            services.shared.setString(
                "phone", response["user"]["phone_number"].toString());
            services.shared.setString("token", response["token"].toString());
            services.shared
                .setString("role", response["user"]["role"].toString());
            services.shared.setString("step", "3");
            // Get.offNamed(Approut.home);
            Get.offAllNamed(Approut.red);
          } else {
            Get.toNamed(Approut.verifyemail, arguments: {"email": email.text});
          }
        } else if (response["status"] == 403) {
          Get.toNamed(Approut.verifyemail, arguments: {"email": email.text});
        } else if (response["status"] == 401) {
          Get.defaultDialog(
              title: "error", content: const Text("Password not correct"));
        } else if (response["status"] == 404) {
          Get.defaultDialog(
              title: "error", content: const Text("email not found"));
        } else {
          Get.defaultDialog(
              title: "Error", content: const Text("please try later"));
          stateerr = Stateerr.failure;
        }
      }

      update();
    }
  }

  @override
  forgetass() {
    Get.toNamed(Approut.forgetpass);
  }
}
