import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/daymodel.dart';
import 'package:fitnessapp/data/remot/dayplanremot.dart';
import 'package:get/get.dart';

class Privplandaycontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  List<Daymodel> days = [];
  final Dayplandata planDayData = Dayplandata(Cud());
  Services services = Get.find();

  String? token;

  int? planId;

  @override
  void onInit() {
    final args = Get.arguments;
    planId = args["planId"];
    super.onInit();
  }

  // استدعاء لجلب البيانات بناءً على الـ planId
  void fetchPlanDays() async {
    stateerr = Stateerr.loding;
    update();
    token = services.shared.getString("token");

    var response = await planDayData.getPlanDays(token!, planId!);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      if (response['status'] == 200) {
        response["days"] == null
            ? []
            : days = (response['days'] as List)
                .map((e) => Daymodel.fromJson(e))
                .toList();
      } else {
        stateerr = Stateerr.serverfailuer;
      }
    }
    update();
  }
}
