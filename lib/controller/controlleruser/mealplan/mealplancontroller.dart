import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealplanmodel.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:get/get.dart';

class UserMealPlansController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Mealplandata mealplandata = Mealplandata(Get.find());

  List<MealPlanModel> mealPlans = [];

  getPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await mealplandata.getmealplan(services.shared.getString("token")!);
    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      if (response['data'] == null) {
        mealPlans = [];
      } else {
        mealPlans = List<MealPlanModel>.from(
          (response['data'] as List).map((e) => MealPlanModel.fromJson(e)),
        );
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
