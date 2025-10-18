import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealmodel.dart';
import 'package:fitnessapp/data/remot/mealremot.dart';
import 'package:get/get.dart';

class MealAdmincontroller extends GetxController {
  Mealdata mealdata = Mealdata(Get.find());
  Services services = Get.find();

  Stateerr stateerr = Stateerr.none;

  List<MealModel> meals = [];

  getAllMeals() async {
    stateerr = Stateerr.loding;
    update();

    var response = await mealdata.getmeal(services.shared.getString("token")!);

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      meals = List<MealModel>.from(
        (response['data'] as List).map((item) => MealModel.fromJson(item)),
      );
    }

    update();
  }

  /// حذف وجبة حسب ID
  deleteMeals(int mealId) async {
    stateerr = Stateerr.loding;
    update();

    var response = await mealdata.deletemeal(
      services.shared.getString("token")!,
      mealId.toString(),
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      meals.removeWhere((meal) => meal.id == mealId);
    }

    update();
  }

  @override
  void onInit() {
    getAllMeals();
    super.onInit();
  }
}
