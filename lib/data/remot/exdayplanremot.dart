import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Exdayplandata {
  Cud cud = Cud();

  Exdayplandata(this.cud);

  // Get all plans
  getexdayPlans(String token, dayId) async {
    var response = await cud.getdatasecure(Applink.getexdayplan(dayId), token);
    return response.fold((l) => l, (r) => r);
  }

  // Add plan
  addexdayPlan(Map<String, dynamic> data, String token, planId, dayId) async {
    var response = await cud.postdatasecure(
        Applink.addexdayplan(planId, dayId), token, data);
    return response.fold((l) => l, (r) => r);
  }

  // Edit plan
  editexdayPlan(Map<String, dynamic> data, String token, planId, dayId,
      exerciseId) async {
    var response = await cud.putdatasecure(
        Applink.editexdayplan(planId, dayId, exerciseId), token, data);
    return response.fold((l) => l, (r) => r);
  }

  // delete plan
  deleteexdayplan(String token, planId, dayId, exerciseId) async {
    var response = await cud.deletedatasecure(
        Applink.deleteexdayplan(planId, dayId, exerciseId), token);
    return response.fold((l) => l, (r) => r);
  }
}
