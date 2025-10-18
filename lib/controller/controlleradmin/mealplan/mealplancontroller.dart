import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealplanmodel.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:get/get.dart';

class Mealplanadmincontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Mealplandata remote = Mealplandata(Get.find());
  Services services = Get.find();

  List<MealPlanModel> mealPlans = [];

  getAllMealPlans() async {
    stateerr = Stateerr.loding;
    update();

    var response = await remote.getmealplan(
      services.shared.getString("token")!,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      response['data'] == null
          ? mealPlans = []
          : mealPlans = List<MealPlanModel>.from(
              (response['data'] as List).map((e) => MealPlanModel.fromJson(e)),
            );
    }

    update();
  }

  deleteMeals(int mealId) async {
    stateerr = Stateerr.loding;
    update();

    var response = await remote.deletemealplan(
      services.shared.getString("token")!,
      mealId.toString(),
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      getAllMealPlans();
      update();
    }

    update();
  }

  @override
  void onInit() {
    getAllMealPlans();
    super.onInit();
  }
}
