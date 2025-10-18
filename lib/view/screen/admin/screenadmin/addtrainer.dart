import 'package:fitnessapp/controller/controlleradmin/admincontrol/addtrainercontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:fitnessapp/view/widget/auth/textformfiler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addtrainer extends StatelessWidget {
  const Addtrainer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Addtrainercontroller());
    return GetBuilder<Addtrainercontroller>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.deepPurple[100],
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[100],
            title: const Text(
              "Add Trainer",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            centerTitle: true,
          ),
          body: Handlingdatarequest(
            stateerr: controller.stateerr,
            child: Form(
              key: controller.f,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: [
                    Container(
                      height: 70,
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.deepPurple[50]!.withAlpha(200),
                          border: Border.all(color: Colors.deepPurple[700]!)),
                      child: Column(
                        children: [
                          const Text(
                            "Add name trainer:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                            height: 5,
                          ),
                          Mytextform(
                              isnumber: false,
                              validat: (val) {
                                return myvalidat(val!, 5, 40, "");
                              },
                              controller: controller.name,
                              widg: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              text: "trainer name",
                              hinttext: "add trainer name"),
                          Container(
                            height: 20,
                          ),
                          const Text("Add email trainer:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            height: 5,
                          ),
                          Mytextform(
                              isnumber: false,
                              validat: (val) {
                                return myvalidat(val!, 5, 40, "");
                              },
                              controller: controller.email,
                              widg: const Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              text: "email",
                              hinttext: "add email"),
                          Container(
                            height: 20,
                          ),
                          const Text("Add password trainer",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            height: 5,
                          ),
                          Mytextform(
                              ontapicon: () {
                                controller.showpass();
                              },
                              secpass: controller.secpass,
                              isnumber: false,
                              validat: (val) {
                                return myvalidat(val!, 5, 40, "password");
                              },
                              controller: controller.password,
                              widg: const Icon(
                                Icons.lock_outlined,
                                color: Colors.grey,
                              ),
                              text: "add password",
                              hinttext: "add password"),
                          Container(
                            height: 20,
                          ),
                          const Text("confirm password trainer",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            height: 5,
                          ),
                          Mytextform(
                              ontapicon: () {
                                controller.showpass();
                              },
                              secpass: controller.secpass,
                              isnumber: false,
                              validat: (val) {
                                return myvalidat(val!, 5, 40, "password");
                              },
                              controller: controller.confpassword,
                              widg: const Icon(
                                Icons.lock_outlined,
                                color: Colors.grey,
                              ),
                              text: "confirm password",
                              hinttext: "confirm password"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10),
                      child: MaterialButton(
                        shape: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple[800]!),
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.deepPurple[50],
                        onPressed: () {
                          controller.addtrainer();
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
