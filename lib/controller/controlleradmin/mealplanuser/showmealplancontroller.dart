import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealplanmodel.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:get/get.dart';

class MealPlanUserController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Mealplandata remote = Mealplandata(Get.find());
  Services services = Get.find();
  late String id;
  List<MealPlanModel> plans = [];

  getUserPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await remote.getmealplanuser(services.shared.getString("token")!, id);

    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      if (response["data"] == null) {
        plans = [];
      } else {
        plans = (response["data"] as List)
            .map((e) => MealPlanModel.fromJson(e))
            .toList();
      }
    }
  }

  deleteplanusermeal(String iid) async {
    stateerr = Stateerr.loding;
    update();

    var response = await remote.deletemealplanuser(
        services.shared.getString("token")!, iid);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      getUserPlans();

      update();
    }

    update();
  }

  @override
  void onInit() {
    id = Get.arguments["id"].toString();
    getUserPlans();
    super.onInit();
  }
}
