import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/view/screen/user/home/home.dart';
import 'package:fitnessapp/view/screen/user/home/progress.dart';
import 'package:fitnessapp/view/screen/user/home/setting.dart';
import 'package:fitnessapp/view/screen/user/meal/nutrition.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class Homescreencontroller extends GetxController {
  getindex(int i);
}

class Homescreencontrollerimp extends Homescreencontroller {
  int currentindex = 0;
  Services services = Get.find();

  @override
  getindex(int i) {
    currentindex = i;
    update();
  }

  List<Widget> mylist = [
    const Home(),
    const Nutrition(),
    const Progressyou(),
    const Setting(),
  ];

  List titleappbar = ["home", "Nutrition", "Progress", "settings"];

  List iconappar = [
    Icons.home,
    Icons.eco,
    Icons.insights,
    Icons.settings,
  ];
}
