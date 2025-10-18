import 'package:fitnessapp/controller/controlleruser/homes/onbordingcontroller.dart';
import 'package:fitnessapp/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagev extends GetView<Onbordingcontrollerimp> {
  const Pagev({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pagecontroller,
        onPageChanged: (val) {
          controller.onpagechange(val);
        },
        itemCount: onbordingg.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 30,
                  ),
                  Text(onbordingg[i].title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.deepPurple)),
                  Container(
                    height: 10,
                  ),
                  Image.asset(
                    onbordingg[i].image!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: 50,
                  ),
                  Text(
                    onbordingg[i].body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
