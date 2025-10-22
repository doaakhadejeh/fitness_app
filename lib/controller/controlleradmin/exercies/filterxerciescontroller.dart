import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/exerciesremot.dart';
import 'package:get/get.dart';

class FilterExercisesController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Exercisedata exerciesdata = Exercisedata(Get.find());

  // Variables to store filters
  int? selectedCategoryId;
  String? accessType;
  bool isActive = false;
  Services services = Get.find();

  List exercises = [];

  filterExercises() async {
    stateerr = Stateerr.loding;
    update();

    Map<String, dynamic> filterData = {
      "category_id": selectedCategoryId,
      "access_type": accessType,
      "is_active": isActive ? 1 : 0,
    };

    var response = await exerciesdata.filterExercises(
        services.shared.getString("token")!,
        filters: filterData);

    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      exercises = response["exercises"];
    }
  }
}
