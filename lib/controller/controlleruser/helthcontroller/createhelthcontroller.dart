import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/helthprofremote.dart';

class Createhelthcontroller extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController height = TextEditingController();
  String? fitnessLevel;
  String? goal;
  Stateerr stateerr = Stateerr.none;
  Helthprofdata helthprofdata = Helthprofdata(Cud());
  Services services = Get.find();
  bool? isComplete;
  List<String>? missingFields = [];

  checkCompletion() async {
    stateerr = Stateerr.loding;
    update();
    var token = services.shared.getString("token");
    // print(token);
    var response = await helthprofdata.completehelth(token!);
    stateerr = handlingdata(response);
    // print(response);
    if (stateerr == Stateerr.success && response["status"] == 200) {
      isComplete = response["is_complete"];
      response["missing_fields"] == null
          ? missingFields = []
          : missingFields = List<String>.from(response["missing_fields"]);
    } else {
      stateerr = Stateerr.failure;
    }
    update();
  }

  void create() async {
    missingFields!.contains("full_name")
        ? services.shared.setString("step", "4")
        : null;

    if (formKey.currentState!.validate()) {
      stateerr = Stateerr.loding;
      update();

      var token = services.shared.getString("token");
      Map<String, dynamic> data = {
        "full_name": fullName.text,
        "height": height.text,
        "fitness_level": fitnessLevel,
        "goal": goal,
      };

      var response = await helthprofdata.storehelth(token!, data);
      stateerr = handlingdata(response);

      if (stateerr == Stateerr.success) {
        services.shared.setString("step", "4");
        Get.snackbar("Success", "Profile Created Successfully");
      } else {
        if (kDebugMode) {
          print(response['status']);
        }
        Get.snackbar("Error", "Failed to create profile");
      }
      update();
    }

    update();
  }

  // gotohome() {
  //   services.shared.setString("step", "4");
  //   Get.toNamed(Approut.home);
  // }
}
