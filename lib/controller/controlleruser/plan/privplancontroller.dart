import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/planemodel.dart';
import 'package:fitnessapp/data/remot/planremot.dart';
import 'package:get/get.dart';

class Privplancontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  List<ExercisePlan> plans = [];
  Services services = Get.find();

  final Plandata planData = Plandata(Cud());

  @override
  void onInit() {
    fetchPlans();
    super.onInit();
  }

  fetchPlans() async {
    stateerr = Stateerr.loding;
    update();

    String token = services.shared.getString("token")!;
    var userid = services.shared.getString("id")!;

    var response = await planData.getprivatPlans(token, userid);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      if (response["status"] == 200) {
        response["assignments"] == null
            ? []
            : plans = (response["assignments"] as List)
                .map((assignment) =>
                    ExercisePlan.fromJson(assignment["exercise_plan"]))
                .toList();
      }
    } else if (response["status"] == 404) {
      stateerr = Stateerr.success;

      response["assignments"]["exercise_plan"] == null;
    } else {
      stateerr = Stateerr.serverfailuer;
    }
    update();
  }
}
