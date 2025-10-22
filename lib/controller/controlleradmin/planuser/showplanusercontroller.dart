import 'package:fitnessapp/data/model/planemodel.dart';
import 'package:fitnessapp/data/remot/planremot.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';

class PlanUserController extends GetxController {
  Services services = Get.find();
  Plandata remote = Plandata(Get.find());

  Stateerr stateerr = Stateerr.none;
  List<ExercisePlan> plans = [];
  String? id;

  getPlansForUser() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await remote.getplanuser(services.shared.getString("token")!, id);
    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      List rawPlans = response['assignments'] ?? [];
      plans = rawPlans
          .map((json) => ExercisePlan.fromJson(json['exercise_plan']))
          .toList();
    }
    update();
  }

  deleteUserHealthProfile(int id) async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await remote.deleteplanuser(services.shared.getString("token")!, id);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      getPlansForUser();

      update();
    }

    update();
  }

  @override
  void onInit() {
    id = Get.arguments["id"].toString();
    getPlansForUser();
    super.onInit();
  }
}
