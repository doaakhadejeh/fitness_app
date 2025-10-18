import 'package:fitnessapp/controller/controlleruser/helthcontroller/createhelthcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Createhelth extends StatelessWidget {
  const Createhelth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Createhelthcontroller());

    return GetBuilder<Createhelthcontroller>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create Health Profile",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple[800],
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  TextFormField(
                      controller: controller.fullName,
                      decoration: const InputDecoration(labelText: 'Full Name'),
                      validator: (val) {
                        return myvalidat(val!, 2, 40, "");
                      }),
                  const SizedBox(height: 10),
                  TextFormField(
                      controller: controller.height,
                      decoration:
                          const InputDecoration(labelText: 'Height (cm)'),
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        return myvalidat(val!, 2, 40, "");
                      }),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: controller.fitnessLevel,
                    items: const [
                      DropdownMenuItem(
                          value: 'beginner', child: Text('Beginner')),
                      DropdownMenuItem(
                          value: 'intermediate', child: Text('Intermediate')),
                      DropdownMenuItem(
                          value: 'advanced', child: Text('Advanced')),
                    ],
                    onChanged: (val) => controller.fitnessLevel = val,
                    decoration:
                        const InputDecoration(labelText: "Fitness Level"),
                    validator: (val) =>
                        val == null ? "Choose fitness level" : null,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: controller.goal,
                    items: const [
                      DropdownMenuItem(
                          value: 'lose_weight', child: Text('Lose Weight')),
                      DropdownMenuItem(
                          value: 'gain_weight', child: Text('Gain Weight')),
                      DropdownMenuItem(
                          value: 'build_muscle', child: Text('Build Muscle')),
                      DropdownMenuItem(
                          value: 'stay_fit', child: Text('Stay Fit')),
                    ],
                    onChanged: (val) => controller.goal = val,
                    decoration: const InputDecoration(labelText: "Goal"),
                    validator: (val) => val == null ? "Choose your goal" : null,
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      controller.create();
                      Get.toNamed(Approut.completehelth);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[800],
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.create();
                      controller.services.shared.setString("step", "4");
                      Get.toNamed(Approut.home);
                    },
                    child: const Text("Skip for now"),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
