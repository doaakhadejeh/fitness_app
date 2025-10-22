import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/mealmodel.dart';
import 'package:fitnessapp/data/remot/categoriesremot.dart';
import 'package:fitnessapp/data/remot/mealremot.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Categoriesdata categoriesdata = Categoriesdata(Get.find());
  Mealdata mealdata = Mealdata(Get.find());

  List categories = [];

  List searchResult = [];
  String searchText = "";

  List<MealModel> meals = [];

  getAllMeals() async {
    stateerr = Stateerr.loding;
    update();

    var response = await mealdata.getmeal(services.shared.getString("token")!);

    stateerr = handlingdata(response);

    if (stateerr == Stateerr.success) {
      if (response['data'] == null) {
        meals = [];
      } else {
        meals = List<MealModel>.from(
          (response['data'] as List).map((item) => MealModel.fromJson(item)),
        );
      }
    }

    update();
  }

  getCategories() async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await categoriesdata.getCategories(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      if (response["categories"] == null) {
        categories = [];
      } else {
        categories = response["categories"];
      }
    }
    update();
  }

  search(String search) async {
    searchText = search;
    stateerr = Stateerr.loding;
    update();
    var response =
        await categoriesdata.searh(services.shared.getString("token")!, search);
    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      if (response["data"] == null) {
        searchResult = [];
      } else {
        searchResult = response["data"];
      }
    }
    update();
  }

  clearSearch() {
    searchText = "";
    searchResult = [];
    update();
  }

  @override
  void onInit() {
    getCategories();
    getAllMeals();
    super.onInit();
  }
}
