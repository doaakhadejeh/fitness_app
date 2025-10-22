import 'dart:io';

import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Exercisedata {
  Cud cud;
  Exercisedata(this.cud);

  filterExercises(String token, {Map<String, dynamic>? filters}) async {
    var response = await cud.postdatasecure(
      Applink.filterexercises,
      token,
      filters ?? {},
    );
    return response.fold((l) => l, (r) => r);
  }

  // delete exercises
  deleteExercises(String token, String id) async {
    var response =
        await cud.deletedatasecure(Applink.deleteExercise(id), token);
    return response.fold((l) => l, (r) => r);
  }

  // Add exercises

  addExercise(Map<String, dynamic> data, File file, String token) async {
    var response = await cud.postdatawithfile(
        Applink.addExercise, data, file, token, 'video');
    return response.fold((l) => l, (r) => r);
  }

  // Get exercises
  getExercises(String token) async {
    var response = await cud.getdatasecure(Applink.exercises, token);
    return response.fold((l) => l, (r) => r);
  }

  // planExercises(String token, String dayId) async {
  //   var response = await cud.getdatasecure(
  //     Applink.exPlan(dayId),
  //     token,
  //   );
  //   return response.fold((l) => l, (r) => r);
  // }
}
