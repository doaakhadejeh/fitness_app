import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/planemodel.dart';
import 'package:fitnessapp/data/remot/planremot.dart';
import 'package:get/get.dart';

class PLancontroller extends GetxController {
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

    var response = await planData.getgeneralPlans(token);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      if (response["status"] == 200) {
        response["plan"] == null
            ? []
            : plans = (response["plan"] as List)
                .map((e) => ExercisePlan.fromJson(e))
                .toList();
      }
    } else if (response["status"] == 404) {
      stateerr = Stateerr.success;
      response["plan"] == null;
    } else {
      stateerr = Stateerr.serverfailuer;
    }
    update();
  }
}
