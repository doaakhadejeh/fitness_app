import 'package:fitnessapp/controller/controlleruser/homes/onbordingcontroller.dart';
import 'package:fitnessapp/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Containercontroller extends StatelessWidget {
  const Containercontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GetBuilder<Onbordingcontrollerimp>(
      init: Onbordingcontrollerimp(),
      builder: (i) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onbordingg.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              width: index == i.currentpage ? 20 : 6,
              height: 6,
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    ));
  }
}
