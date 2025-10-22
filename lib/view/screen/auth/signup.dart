import 'package:fitnessapp/controller/authcontroller/signupcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/function/exitalert.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:fitnessapp/view/widget/auth/textformfiler.dart';
import 'package:fitnessapp/view/widget/bottomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Signupcontrollerimp());
    return PopScope(
      canPop: false,
      onPopInvoked: exitapp,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text("Sign Up"),
          titleTextStyle: Theme.of(context).textTheme.bodySmall,
          centerTitle: true,
        ),
        body: GetBuilder<Signupcontrollerimp>(builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: ListView(children: [
              Form(
                  key: controller.f,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Center(
                          child: Icon(
                            Icons.fitness_center,
                            size: 110,
                            color: Colors.deepPurple[200],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Create Your Account",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Sign up with email and password to get started",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 30),
                        Mytextform(
                          isnumber: false,
                          validat: (val) {
                            return myvalidat(val!, 3, 30, "username");
                          },
                          controller: controller.userName,
                          widg: const Icon(Icons.person_outline,
                              color: Colors.grey),
                          text: "Username",
                          hinttext: "Enter username",
                        ),
                        const SizedBox(height: 10),
                        Mytextform(
                          isnumber: false,
                          validat: (val) {
                            return myvalidat(val!, 10, 40, "email");
                          },
                          controller: controller.email,
                          widg: const Icon(Icons.email_outlined,
                              color: Colors.grey),
                          text: "Email",
                          hinttext: "Enter email",
                        ),
                        const SizedBox(height: 10),
                        Mytextform(
                          isnumber: false,
                          validat: (val) {
                            return myvalidat(val!, 10, 20, "phone");
                          },
                          controller: controller.phone,
                          widg: const Icon(Icons.phone_outlined,
                              color: Colors.grey),
                          text: "Phone",
                          hinttext: "Enter phone number",
                        ),
                        const SizedBox(height: 10),
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
                          widg: const Icon(Icons.lock_outlined,
                              color: Colors.grey),
                          text: "Password",
                          hinttext: "Enter password",
                        ),
                        const SizedBox(height: 10),
                        Mytextform(
                          ontapicon: () {
                            controller.showpass();
                          },
                          secpass: controller.secpass,
                          isnumber: false,
                          validat: (val) {
                            return myvalidat(val!, 5, 40, "password");
                          },
                          controller: controller.confpass,
                          widg: const Icon(Icons.lock_outlined,
                              color: Colors.grey),
                          text: " Confirm Password",
                          hinttext: "Confirm password",
                        ),
                        const SizedBox(height: 30),
                        Bottomlang(
                          text: "Sign Up",
                          onPressed: () async {
                            controller.sinup();
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            InkWell(
                              onTap: () {
                                controller.login();
                              },
                              child: Text(
                                " Log in",
                                style: TextStyle(
                                    color: Colors.deepPurple[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ]),
          );
        }),
      ),
    );
  }
}
