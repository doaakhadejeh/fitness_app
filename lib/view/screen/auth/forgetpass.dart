import 'package:fitnessapp/controller/authcontroller/forgetpasswordcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:fitnessapp/view/widget/auth/textformfiler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Forgetpasscontroller());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("Forget Password!"),
        titleTextStyle: const TextStyle(color: Colors.deepPurple),
        centerTitle: true,
      ),
      body: GetBuilder<Forgetpasscontroller>(builder: (controller) {
        return Handlingdatarequest(
          stateerr: controller.stateerr!,
          child: Form(
            key: controller.f,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Check Email",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Center(
                    child: Text("add you email for veryfiy password",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  Container(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Mytextform(
                        isnumber: false,
                        validat: (val) {
                          return myvalidat(val!, 10, 40, "email");
                        },
                        controller: controller.email,
                        widg: const Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        text: "Email",
                        hinttext: "Enter your email"),
                  ),
                  Container(
                    height: 60,
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.veryfiypass();
                    },
                    color: Colors.deepPurple,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      "continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
