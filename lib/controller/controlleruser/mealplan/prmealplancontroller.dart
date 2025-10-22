import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealplanmodel.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:get/get.dart';

class UserPrMealPlansController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Mealplandata mealplandata = Mealplandata(Get.find());

  MealPlanModel? mealPlans;

  getPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await mealplandata.getmymealplan(services.shared.getString("token")!);
    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      if (response['data'] == null) {
        mealPlans = null;
      } else {
        // List d = response['data'];
        // mealPlans = List<MealPlanModel>.from(
        //   (d).map((e) => MealPlanModel.fromJson(e)),
        // );
        mealPlans = MealPlanModel.fromJson(response['data']);
      }
    }

    update();
  }

  @override
  void onInit() {
    getPlans();
    super.onInit();
  }
}
