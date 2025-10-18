import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Mealgredientdata {
  Cud cud = Cud();

  Mealgredientdata(this.cud);

  // Get all meal
  getmealgr(String token, mealId) async {
    var response = await cud.getdatasecure(Applink.getmealgr(mealId), token);
    return response.fold((l) => l, (r) => r);
  }

  // Add meal
  addmealgr(Map<String, dynamic> data, String token, mealId) async {
    var response =
        await cud.postdatasecure(Applink.addmealgr(mealId), token, data);
    return response.fold((l) => l, (r) => r);
  }

  // Edit meal
  editmealgr(Map<String, dynamic> data, String token, mealId, id) async {
    var response =
        await cud.putdatasecure(Applink.editmealgr(mealId, id), token, data);
    return response.fold((l) => l, (r) => r);
  }

  // delete meal
  deletemealgr(String token, String id, mealId) async {
    var response =
        await cud.deletedatasecure(Applink.deletemealgr(mealId, id), token);
    return response.fold((l) => l, (r) => r);
  }
}
