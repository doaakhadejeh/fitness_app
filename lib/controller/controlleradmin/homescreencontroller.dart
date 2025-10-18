import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/view/screen/user/home/home.dart';
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
    Container(),
    Container(),
    Container(),
  ];

  List titleappbar = ["home", "Nutrition", "Progress", "settings"];

  List iconappar = [
    Icons.fitness_center,
    Icons.eco,
    Icons.insights,
    Icons.settings,
  ];
}
