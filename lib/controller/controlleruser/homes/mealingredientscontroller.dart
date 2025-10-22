import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealintegrademodel.dart';
import 'package:fitnessapp/data/remot/mealgredientremote.dart';
import 'package:get/get.dart';

class MealIngredientsController extends GetxController {
  Mealgredientdata mealdata = Mealgredientdata(Get.find());

  Services services = Get.find();

  Stateerr stateerr = Stateerr.none;
  List<MealIngredientModel> ingredients = [];

  late int mealId;

  getIngredients() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await mealdata.getmealgr(services.shared.getString("token")!, mealId);

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      ingredients = List<MealIngredientModel>.from(
        (response['data']['ingredients'] as List)
            .map((e) => MealIngredientModel.fromJson(e)),
      );
    }

    update();
  }

  @override
  void onInit() {
    mealId = Get.arguments['mealId'];
    getIngredients();
    super.onInit();
  }
}
