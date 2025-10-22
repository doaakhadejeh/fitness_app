import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/planremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPlanController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Stateerr stateerr = Stateerr.none;

  Services services = Get.find();
  Plandata plandata = Plandata(Get.find());

  late TextEditingController title;
  late TextEditingController note;

  String? id;
  // String goal = "lose_weight";
  // String fitnessLevel = "beginner";
  String type = "general";
  // String accessType = "public";

  // Lists for dropdown values
  final List<String> goals = [
    "lose_weight",
    "gain_weight",
    "build_muscle",
    "stay_fit"
  ];

  final List<String> levels = ["beginner", "intermediate", "advanced"];

  final List<String> types = ["general", "private"];

  @override
  void onInit() {
    super.onInit();
    final plan = Get.arguments;

    id = plan.id.toString();
    title = TextEditingController(text: plan.title ?? "");
    note = TextEditingController(text: plan.note ?? "");

    // goal = plan.goal ?? "lose_weight";
    // fitnessLevel = plan.fitnessLevel ?? "beginner";
    type = plan.type ?? "general";
    // accessType = plan.access_type ?? "public";
  }

  @override
  void dispose() {
    title.dispose();
    note.dispose();
    super.dispose();
  }

  // void setGoal(String? val) {
  //   if (val != null) {
  //     goal = val;
  //     update();
  //   }
  // }

  // void setLevel(String? val) {
  //   if (val != null) {
  //     fitnessLevel = val;
  //     update();
  //   }
  // }

  void setType(String? val) {
    if (val != null) {
      type = val;
      update();
    }
  }

  // void setAccessType(String? val) {
  //   if (val != null) {
  //     accessType = val;
  //     update();
  //   }
  // }

  void editPlan() async {
    var form = formKey.currentState;
    if (form!.validate()) {
      stateerr = Stateerr.loding;
      update();

      Map<String, dynamic> data = {
        "title": title.text,
        // "goal": goal,
        // "fitness_level": fitnessLevel,
        "type": type,
        "note": note.text,
        // "access_type": accessType,
      };

      // if (accessType == "private") {
      //   data["user_id"] = services.shared.getString("id").toString();
      // }

      var response = await plandata.editPlan(
        data,
        services.shared.getString("token")!,
        id!,
      );

      stateerr = handlingdata(response);
      update();

      if (stateerr == Stateerr.success) {
        Get.offNamed(Approut.plane);
      } else {
        Get.defaultDialog(
          title: "Error",
          content: const Text("Failed to update plan."),
        );
      }
    }
  }
}
