import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/profileremote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Sittingcontroller extends GetxController {
  logout();
}

class Sittingcontrollerimp extends Sittingcontroller {
  Services services = Get.find();
  Profiledata remote = Profiledata(Get.find());
  Stateerr stateerr = Stateerr.none;
  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController newpassord;
  late TextEditingController confpassword;
  late TextEditingController phone;

  @override
  void onInit() {
    name = TextEditingController();
    password = TextEditingController();
    newpassord = TextEditingController();
    confpassword = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  changepassword() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await remote.changepassword(services.shared.getString("token")!, {
      "current_password": password.text,
      "new_password": newpassord.text,
      "password_confirmation": confpassword.text,
    });

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.snackbar("Success", "change password Successfully");
      Get.offNamed(Approut.mealplan);
    } else {
      Get.snackbar("Error", "Failed to change password ");
    }

    update();
  }

  updateprofile() async {
    stateerr = Stateerr.loding;
    update();

    var response = await remote.updateprofile(
        services.shared.getString("token")!,
        {"name": name.text, "phone_number": phone.text});

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      Get.snackbar("Success", "update profile Successfully");
      Get.offNamed(Approut.mealplan);
    } else {
      Get.snackbar("Error", "Failed to update profile");
    }

    update();
  }

  @override
  logout() {
    services.shared.getString("id")!;
    services.shared.clear();
    Get.offAllNamed(Approut.onbording);
  }
}
