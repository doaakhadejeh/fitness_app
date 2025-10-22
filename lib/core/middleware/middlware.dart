import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymidlware extends GetMiddleware {
  @override
  int? get priority => 1;

  Services s = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (s.shared.getString("step") == "3") {
      if (s.shared.getString("role") == "user") {
        return const RouteSettings(name: Approut.createhelth);
      } else {
        return const RouteSettings(name: Approut.homeadmin);
      }
    }

    if (s.shared.getString("step") == "2") {
      return const RouteSettings(name: Approut.login);
    }

    if (s.shared.getString("step") == "1") {
      return const RouteSettings(name: Approut.onbording);
    }

    if (s.shared.getString("step") == "4") {
      return const RouteSettings(name: Approut.home);
    }
    return null;
    // return const RouteSettings(name: Approut.onbording);
  }
}
