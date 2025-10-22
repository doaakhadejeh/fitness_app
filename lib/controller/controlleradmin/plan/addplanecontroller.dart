import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/planremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPlanController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Stateerr stateerr = Stateerr.none;

  Services services = Get.find();
  Plandata plandata = Plandata(Get.find());

  // Controllers
  late TextEditingController title;
  late TextEditingController note;

  // String accessType = "public";
  bool isActive = true;

  // قيم enum
  String goal = "lose_weight";
  String fitnessLevel = "beginner";
  String type = "general";

  List<String> goals = [
    "lose_weight",
    "gain_weight",
    "build_muscle",
    "stay_fit"
  ];
  List<String> levels = ["beginner", "intermediate", "advanced"];
  List<String> types = ["general", "private"];

  @override
  void onInit() {
    title = TextEditingController();
    note = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    note.dispose();
    super.dispose();
  }

  // void setAccessType(String val) {
  //   accessType = val;
  //   update();
  // }

  void setGoal(String val) {
    goal = val;
    update();
  }

  void setLevel(String val) {
    fitnessLevel = val;
    update();
  }

  void setType(String val) {
    type = val;
    update();
  }

  void setIsActive(bool val) {
    isActive = val;
    update();
  }

  addPlan() async {
    var form = formKey.currentState;
    if (form!.validate()) {
      stateerr = Stateerr.loding;
      update();

      Map<String, dynamic> data = {
        "title": title.text,
        "goal": goal,
        "fitness_level": fitnessLevel,
        "type": type,
        "is_active": isActive ? "1" : "0",
        "note": note.text,
        // "access_type": accessType,
        // "created_by": services.shared.getString("id").toString(),
      };

      // if (type == "private") {
      //   data["user_id"] = services.shared.getString("id").toString();
      // }

      var response =
          await plandata.addPlan(data, services.shared.getString("token")!);

      stateerr = handlingdata(response);
      update();

      if (stateerr == Stateerr.success) {
        // Get.offNamed(Approut.plane);
        Get.back();
      } else {
        Get.defaultDialog(
          title: "Error",
          content: const Text("Failed to add plan."),
        );
      }
    }
  }
}
