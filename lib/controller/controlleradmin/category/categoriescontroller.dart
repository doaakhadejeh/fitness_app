import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/categoriesremot.dart';
import 'package:get/get.dart';

class CategoriesAController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Categoriesdata categoriesdata = Categoriesdata(Get.find());

  List categories = [];

  getCategories() async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await categoriesdata.getCategories(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      response["categories"] == null
          ? categories = []
          : categories = response["categories"];
    }
  }

  deleteCategories(id) async {
    stateerr = Stateerr.loding;
    update();
    var response = await categoriesdata.deletecategory(
        services.shared.getString("token")!, id);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      getCategories();

      update();
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
