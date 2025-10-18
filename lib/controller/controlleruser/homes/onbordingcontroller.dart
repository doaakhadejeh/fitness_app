import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Onbordingcontroller extends GetxController {
  onnext();
  onpagechange(int index);
}

class Onbordingcontrollerimp extends Onbordingcontroller {
  int currentpage = 0;
  late PageController pagecontroller;

  Services s = Get.find();
  @override
  onnext() {
    currentpage++;

    if (currentpage > onbordingg.length - 1) {
      s.shared.setString("step", "2");
      Get.offAllNamed(Approut.login);
    } else {
      pagecontroller.animateToPage(currentpage,
          duration: const Duration(milliseconds: 600), curve: Curves.linear);
    }
  }

  @override
  onpagechange(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
