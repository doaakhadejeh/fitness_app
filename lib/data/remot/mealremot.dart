import 'dart:io';
import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Mealdata {
  Cud cud = Cud();

  Mealdata(this.cud);

  // Get all meal
  getmeal(String token) async {
    var response = await cud.getdatasecure(Applink.meal, token);
    return response.fold((l) => l, (r) => r);
  }

  // Add meal
  addmeal(Map<String, dynamic> data, File file, String token) async {
    var response =
        await cud.postdatawithfile(Applink.addmeal, data, file, token, "image");
    return response.fold((l) => l, (r) => r);
  }

  // Edit meal
  editmeal(Map<String, dynamic> data, File? file, String token, id) async {
    var response = await cud.putdatawithfile(
        Applink.editmeal(id), data, file, token, "image");
    return response.fold((l) => l, (r) => r);
  }

  // delete meal
  deletemeal(String token, String id) async {
    var response = await cud.deletedatasecure(Applink.deletemeal(id), token);
    return response.fold((l) => l, (r) => r);
  }
}
