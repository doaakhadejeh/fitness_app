import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/progressremote.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Progresscontroller extends GetxController {
  Services services = Get.find();
  Progressdata progressdata = Progressdata(Get.find());
  Stateerr stateerr = Stateerr.none;

  String? username;
  double? currentWeight;
  String? goal;
  double? workoutPercent;
  double? levelProgress;
  String? userLevel;
  String? lastUpdate;

  List<dynamic> weightHistory = [];
  List<dynamic> bodyMeasurements = [];

  bool get hasWeightHistory => weightHistory.isNotEmpty;
  bool get hasBodyMeasurements => bodyMeasurements.isNotEmpty;

  String get encouragementMessage {
    if ((workoutPercent ?? 0.0) == 0) {
      return "You haven't started yet — you got this 💪";
    } else if ((workoutPercent ?? 0.0) < 0.4) {
      return "Small steps matter, keep going! 🚶‍♀️";
    } else if ((workoutPercent ?? 0.0) >= 0.7) {
      return "You're smashing it! 🔥";
    } else {
      return "Keep it up, you're doing great!";
    }
  }

  @override
  void onInit() {
    getProgress();
    super.onInit();
  }

  getProgress() async {
    stateerr = Stateerr.loding;
    update();

    var token = services.shared.getString("token");
    if (token == null) {
      stateerr = Stateerr.unauthorized;
      update();
      return;
    }

    var response = await progressdata.getProgress(token);
    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      if (response["status"] == 200) {
        var data = response["data"];

        username = data["username"];
        currentWeight = double.tryParse(data["current_weight"].toString());
        goal = data["goal"]; // تعديل: استبدل goal_weight

        workoutPercent =
            double.tryParse(data["workout_percent"].toString()) != null
                ? double.parse(data["workout_percent"].toString()) / 100
                : 0.0;

        levelProgress =
            double.tryParse(data["level_progress"].toString()) != null
                ? double.parse(data["level_progress"].toString()) / 100
                : 0.0;

        userLevel = data["user_level"];

        if (data["last_update"] != null) {
          try {
            DateTime date = DateTime.parse(data["last_update"]);
            lastUpdate = DateFormat('yyyy-MM-dd').format(date);
          } catch (e) {
            lastUpdate = data["last_update"];
          }
        } else {
          lastUpdate = null;
        }

        weightHistory = data["weight_history"] is List
            ? List.from(data["weight_history"])
            : [];

        bodyMeasurements = data["body_measurements"] is List
            ? List.from(data["body_measurements"])
            : [];
      } else {
        stateerr = Stateerr.failure;
      }
    }

    update();
  }
}
