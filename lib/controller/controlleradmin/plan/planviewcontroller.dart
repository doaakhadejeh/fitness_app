import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/planemodel.dart';
import 'package:fitnessapp/data/remot/planremot.dart';
import 'package:get/get.dart';

class PlanViewController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Plandata plandata = Plandata(Get.find());

  List<ExercisePlan> plans = [];

  getPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response = await plandata.getPlans(services.shared.getString("token")!);

    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      if (response["status"] == 200) {
        plans = (response["plans"] as List)
            .map((e) => ExercisePlan.fromJson(e))
            .toList();
      } else {
        stateerr = Stateerr.serverfailuer;
      }
    }
  }

  deleteplan(id) async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await plandata.deleteplan(services.shared.getString("token")!, id);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      getPlans();
      update();
    }
  }

  @override
  void onInit() {
    getPlans();
    super.onInit();
  }
}
