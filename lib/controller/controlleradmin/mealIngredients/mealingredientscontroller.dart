import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealintegrademodel.dart';
import 'package:fitnessapp/data/remot/mealgredientremote.dart';
import 'package:get/get.dart';

class MealIngredientsAdminController extends GetxController {
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

  // ✅ تابع حذف مكون من الوجبة
  deleteIngredient(int ingredientId) async {
    stateerr = Stateerr.loding;
    update();

    var response = await mealdata.deletemealgr(
        services.shared.getString("token")!,
        ingredientId.toString(),
        mealId.toString());

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      // ingredients.removeWhere((e) => e.id == ingredientId);
      getIngredients();
      update();
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
