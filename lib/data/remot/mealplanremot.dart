import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Mealplandata {
  Cud cud = Cud();

  Mealplandata(this.cud);

  // Get all meal
  getmealplan(String token) async {
    var response = await cud.getdatasecure(Applink.mealplan, token);
    return response.fold((l) => l, (r) => r);
  }

  //get mymeal

  getmymealplan(String token) async {
    var response = await cud.getdatasecure(Applink.mymealplan, token);
    return response.fold((l) => l, (r) => r);
  }

  //Get details meal
  getdetmealplan(String token, id) async {
    var response = await cud.getdatasecure(Applink.gedettmealplan(id), token);
    return response.fold((l) => l, (r) => r);
  }

  // Add meal
  addmealplan(Map<String, dynamic> data, String token) async {
    var response = await cud.postdatasecure(
      Applink.addmealplan,
      token,
      data,
    );
    return response.fold((l) => l, (r) => r);
  }

  // Edit meal
  editmealplan(Map<String, dynamic> data, String token, id) async {
    var response = await cud.putDataSecureJson(
      Applink.editmealplan(id),
      token,
      data,
    );
    return response.fold((l) => l, (r) => r);
  }

  // delete meal
  deletemealplan(String token, String id) async {
    var response =
        await cud.deletedatasecure(Applink.deletemealplan(id), token);
    return response.fold((l) => l, (r) => r);
  }

  //for admin controll

  // Get  meal
  getmealplanuser(String token, userId) async {
    var response = await cud.getdatasecure(
        Applink.showassignmealplantouser(userId), token);
    return response.fold((l) => l, (r) => r);
  }

  // Add meal
  addmealplanuser(Map<String, dynamic> data, String token, userId) async {
    var response = await cud.postdatasecure(
      Applink.assignmealplantouser(userId),
      token,
      data,
    );
    return response.fold((l) => l, (r) => r);
  }

  getgenmeal(String token) async {
    var response = await cud.getdatasecure(Applink.gnmealplan, token);
    return response.fold((l) => l, (r) => r);
  }

  // Edit meal
  editmealplanuser(
      Map<String, dynamic> data, String token, assignmentId) async {
    var response = await cud.putdatasecure(
      Applink.updateassignmealplantouser(assignmentId),
      token,
      data,
    );
    return response.fold((l) => l, (r) => r);
  }

  // delete meal
  deletemealplanuser(String token, assignmentId) async {
    var response = await cud.deletedatasecure(
        Applink.deleteassignmealplantouser(assignmentId), token);
    return response.fold((l) => l, (r) => r);
  }
}
