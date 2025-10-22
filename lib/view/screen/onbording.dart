import 'package:fitnessapp/controller/controlleruser/homes/onbordingcontroller.dart';
import 'package:fitnessapp/view/widget/onbordingwidget/bottom.dart';
import 'package:fitnessapp/view/widget/onbordingwidget/containercontroller.dart';
import 'package:fitnessapp/view/widget/onbordingwidget/pageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onbording extends GetView<Onbordingcontroller> {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onbordingcontrollerimp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          minimum: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Expanded(flex: 3, child: Pagev()),
              // Spacer(
              //   flex: 2,
              // ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Containercontroller(),
                      Spacer(
                        flex: 1,
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Botoomonbording(),
                    ],
                  ))
            ],
          )),
    );
  }
}
