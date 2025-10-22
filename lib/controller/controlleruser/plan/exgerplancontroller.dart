import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/data/model/exdayplanmodel.dart';
import 'package:fitnessapp/data/remot/exdayplanremot.dart';
import 'package:get/get.dart';

class Exgnrplancontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  List<PlanExerciseModel> exercises = [];
  final Exdayplandata planexData = Exdayplandata(Cud());

  String? token;

  String? dayId;

  @override
  void onInit() {
    final args = Get.arguments;
    dayId = args["DayId"];
    token = args["token"];
    super.onInit();
  }

  void fetchPlanex() async {
    stateerr = Stateerr.loding;
    update();

    var response = await planexData.getexdayPlans(token!, dayId!);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      if (response['status'] == 200) {
        response['exercises'] == null
            ? []
            : exercises = (response['exercises'] as List)
                .map((e) => PlanExerciseModel.fromJson(e))
                .toList();
      } else {
        stateerr = Stateerr.serverfailuer;
      }
    }
    update();
  }
}
