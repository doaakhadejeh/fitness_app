import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/exerciesmodel.dart';
import 'package:fitnessapp/data/remot/exerciesremot.dart';
import 'package:get/get.dart';

class ExerciesController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Exercisedata exerciesdata = Exercisedata(Get.find());

  List<Exercisemodel> exercises = [];

  getExercises() async {
    stateerr = Stateerr.loding;
    update();

    var response =
        await exerciesdata.getExercises(services.shared.getString("token")!);

    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      exercises = (response['exercises'] as List)
          .map((e) => Exercisemodel.fromJson(e))
          .toList();
    }
  }

  deleteexercies(id) async {
    stateerr = Stateerr.loding;
    update();
    var response = await exerciesdata.deleteExercises(
        services.shared.getString("token")!, id);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      getExercises();
      update();
    }
  }

  @override
  void onInit() {
    getExercises();
    super.onInit();
  }
}
