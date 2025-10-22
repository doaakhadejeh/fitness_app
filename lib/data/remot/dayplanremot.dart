// lib/data/remote/plandaydata.dart
import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Dayplandata {
  final Cud cud;
  Dayplandata(this.cud);

  getPlanDays(String token, int planId) async {
    String url = Applink.dayPlan(planId);
    var response = await cud.getdatasecure(url, token);
    return response.fold((l) => l, (r) => r);
  }

  // Add plan
  adddayPlan(Map<String, dynamic> data, String token, planId) async {
    var response =
        await cud.postdatasecure(Applink.adddayplan(planId), token, data);
    return response.fold((l) => l, (r) => r);
  }

  // Edit plan
  editdayPlan(Map<String, dynamic> data, String token, dayId) async {
    var response =
        await cud.putdatasecure(Applink.editdayplan(dayId), token, data);
    return response.fold((l) => l, (r) => r);
  }

  // delete plan
  deletedayplan(String token, String id) async {
    var response = await cud.deletedatasecure(Applink.deletedayplan(id), token);
    return response.fold((l) => l, (r) => r);
  }
}
