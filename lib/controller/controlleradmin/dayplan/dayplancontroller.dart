import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/daymodel.dart';
import 'package:fitnessapp/data/remot/dayplanremot.dart';
import 'package:get/get.dart';

class DayplanViewController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Dayplandata dayplandata = Dayplandata(Get.find());

  List<Daymodel> dayplans = [];

  late int id;
  getdayPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await dayplandata.getPlanDays(services.shared.getString("token")!, id);

    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      if (response["status"] == 200) {
        response["days"] == null
            ? []
            : dayplans = (response["days"] as List)
                .map((e) => Daymodel.fromJson(e))
                .toList();
      } else {
        stateerr = Stateerr.serverfailuer;
      }
    }
  }

  deleteplan(id) async {
    stateerr = Stateerr.loding;
    update();
    var response = await dayplandata.deletedayplan(
        services.shared.getString("token")!, id);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      getdayPlans();
      update();
    }
  }

  @override
  void onInit() {
    id = Get.arguments["planid"];

    getdayPlans();
    super.onInit();
  }
}
