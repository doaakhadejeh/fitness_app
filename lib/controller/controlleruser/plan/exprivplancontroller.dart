import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/exdayplanmodel.dart';
import 'package:fitnessapp/data/remot/exdayplanremot.dart';
import 'package:get/get.dart';

class Exprivplancontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  List<PlanExerciseModel> exercises = [];
  final Exdayplandata planexData = Exdayplandata(Cud());
  Services services = Get.find();

  String? token;

  String? dayId;

  @override
  void onInit() {
    final args = Get.arguments;
    dayId = args["DayId"].toString();
    fetchPlanex();
    super.onInit();
  }

  void fetchPlanex() async {
    stateerr = Stateerr.loding;
    update();
    String token = services.shared.getString("token")!;
    var response = await planexData.getexdayPlans(token, dayId!);

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
