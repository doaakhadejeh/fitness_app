import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Plandata {
  Cud cud;
  Plandata(this.cud);

  Future getgeneralPlans(
    String token,
  ) async {
    String link = Applink.generalplan;

    var response = await cud.getdatasecure(link, token);
    return response.fold((l) => l, (r) => r);
  }

  Future getprivatPlans(String token, String id) async {
    String link = Applink.privPlan(id);

    var response = await cud.getdatasecure(link, token);
    return response.fold((l) => l, (r) => r);
  }

  // Get all plans
  getPlans(String token) async {
    var response = await cud.getdatasecure(Applink.plans, token);
    return response.fold((l) => l, (r) => r);
  }

  // Add plan
  addPlan(Map<String, dynamic> data, String token) async {
    var response = await cud.postdatasecure(Applink.addPlan, token, data);
    return response.fold((l) => l, (r) => r);
  }

  // Edit plan
  editPlan(Map<String, dynamic> data, String token, String id) async {
    var response =
        await cud.putdatasecure("${Applink.editPlan}/$id", token, data);
    return response.fold((l) => l, (r) => r);
  }

  // delete plan
  deleteplan(String token, String id) async {
    var response = await cud.deletedatasecure(Applink.deletePlan(id), token);
    return response.fold((l) => l, (r) => r);
  }

  //for admin controll

  // Get  meal
  getplanuser(String token, userId) async {
    var response =
        await cud.getdatasecure(Applink.showassignplantouser(userId), token);
    return response.fold((l) => l, (r) => r);
  }

  // Add meal
  addplanuser(Map<String, dynamic> data, String token, userId) async {
    var response = await cud.postdatasecure(
      Applink.assignplantouser(userId),
      token,
      data,
    );
    return response.fold((l) => l, (r) => r);
  }

  // Edit meal
  editplanuser(Map<String, dynamic> data, String token, assignmentId) async {
    var response = await cud.putdatasecure(
      Applink.updateassignplantouser(assignmentId),
      token,
      data,
    );
    return response.fold((l) => l, (r) => r);
  }

  // delete meal
  deleteplanuser(String token, assignmentId) async {
    var response = await cud.deletedatasecure(
        Applink.deleteassignplantouser(assignmentId), token);
    return response.fold((l) => l, (r) => r);
  }
}
