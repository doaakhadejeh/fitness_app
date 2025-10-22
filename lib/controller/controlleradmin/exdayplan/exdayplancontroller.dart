import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/exdayplanmodel.dart';
import 'package:fitnessapp/data/remot/exdayplanremot.dart';
import 'package:get/get.dart';

class DayexplanViewController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Exdayplandata exdayplandata = Exdayplandata(Get.find());

  List<PlanExerciseModel> exdayplans = [];

  int? dayid;
  int? planid;

  getexdayPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response = await exdayplandata.getexdayPlans(
        services.shared.getString("token")!, dayid);

    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      if (response["status"] == 200 || response["status"] == 201) {
        response["exercises"] == null
            ? []
            : exdayplans = (response["exercises"] as List)
                .map((e) => PlanExerciseModel.fromJson(e))
                .toList();
      } else {
        stateerr = Stateerr.serverfailuer;
      }
    }
  }

  deleteplan(id) async {
    stateerr = Stateerr.loding;
    update();
    var response = await exdayplandata.deleteexdayplan(
        services.shared.getString("token")!, planid, dayid, id);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      getexdayPlans();
      update();
    }
  }

  @override
  void onInit() {
    planid = Get.arguments["planid"];
    dayid = Get.arguments["dayid"];

    getexdayPlans();
    super.onInit();
  }
}
