import 'package:fitnessapp/controller/controlleradmin/dayplan/editdayplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Editdayplan extends StatelessWidget {
  const Editdayplan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Editdayplancontroller());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Day"),
        backgroundColor: Colors.deepPurple,
      ),
      body: GetBuilder<Editdayplancontroller>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: Form(
              key: controller.formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    controller: controller.dayNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Day Number",
                      prefixIcon: Icon(Icons.confirmation_number),
                    ),
                    validator: (val) => myvalidat(val!, 1, 3, "day number"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: controller.description,
                    decoration: const InputDecoration(
                      labelText: "Description (optional)",
                      prefixIcon: Icon(Icons.description),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                    ),
                    onPressed: () {
                      controller.editDay();
                    },
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
