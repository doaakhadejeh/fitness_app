import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:get/get.dart';

class MealPlanUserDetailsController extends GetxController {
  Mealplandata mealplandata = Mealplandata(Get.find());
  Services services = Get.find();

  Stateerr stateerr = Stateerr.none;

  late int mealPlanId;
  Map mealPlan = {}; // بنخليها Map مباشرة بدون موديل

  getDetails() async {
    stateerr = Stateerr.loding;
    update();

    var response = await mealplandata.getdetmealplan(
      services.shared.getString("token")!,
      mealPlanId,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      mealPlan = response['data']; // بدون أي تعديل
    }

    update();
  }

  @override
  void onInit() {
    mealPlanId = Get.arguments['id'];
    getDetails();
    super.onInit();
  }
}
