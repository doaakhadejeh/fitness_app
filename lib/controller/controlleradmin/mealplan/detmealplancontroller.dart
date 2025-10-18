import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealmodel.dart';
import 'package:fitnessapp/data/remot/mealplanremot.dart';
import 'package:get/get.dart';

class MealPlanDetailsController extends GetxController {
  Services services = Get.find();
  Mealplandata mealPlanRemote = Mealplandata(Get.find());

  Stateerr stateerr = Stateerr.none;

  late int mealPlanId;

  String title = "";
  String type = "";
  String? goal;
  String? note;
  String? description;
  String? createdBy;

  List<MealModel> meals = [];

  @override
  void onInit() {
    mealPlanId = Get.arguments['planId'];
    fetchDetails();
    super.onInit();
  }

  fetchDetails() async {
    stateerr = Stateerr.loding;
    update();

    var response = await mealPlanRemote.getdetmealplan(
      services.shared.getString("token")!,
      mealPlanId,
    );

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      var data = response['data'];
      title = data['title'];
      type = data['type'];
      goal = data['goal'];
      note = data['note'];
      description = data['description'];
      createdBy = data['created_by'].toString();

      // Load meals with ingredients
      meals = List<MealModel>.from(
        (data['meals'] as List).map((e) => MealModel.fromJson(e)),
      );
    }

    update();
  }
}
