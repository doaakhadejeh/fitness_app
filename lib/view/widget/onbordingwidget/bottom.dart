import 'package:fitnessapp/controller/controlleruser/homes/onbordingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Botoomonbording extends GetView<Onbordingcontrollerimp> {
  const Botoomonbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 50,
        child: MaterialButton(
          onPressed: () {
            controller.onnext();
          },
          color: Colors.deepPurple,
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          child: const Text(
            "Next",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
