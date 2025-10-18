import 'package:fitnessapp/controller/authcontroller/resivepasscontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:fitnessapp/view/widget/auth/textformfiler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Resivepass extends StatelessWidget {
  const Resivepass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Resivepasscontroller());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("Reset password"),
        titleTextStyle: const TextStyle(color: Colors.grey),
        centerTitle: true,
      ),
      body: GetBuilder<Resivepasscontroller>(builder: (controller) {
        return Handlingdatarequest(
          stateerr: controller.stateerr!,
          child: Form(
            key: controller.f,
            child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Enter new password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  // Center(
                  //   child: Text(
                  //     "please enter a new password and Confirm password to reset",
                  //     textAlign: TextAlign.center,
                  //     style: Theme.of(context).textTheme.bodyLarge,
                  //   ),
                  // ),
                  Container(
                    height: 10,
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
                      text: "Password",
                      hinttext: "Enter your password"),
                  Container(
                    height: 13,
                  ),
                  GetBuilder<Resivepasscontroller>(builder: (context) {
                    return Mytextform(
                        ontapicon: () {
                          controller.showpass();
                        },
                        secpass: controller.secpass,
                        isnumber: false,
                        validat: (val) {
                          return myvalidat(val!, 5, 40, "password");
                        },
                        controller: controller.compass,
                        widg: const Icon(
                          Icons.lock_outlined,
                          color: Colors.grey,
                        ),
                        text: "confirm Password",
                        hinttext: "confirm your new password");
                  }),
                  Container(
                    height: 50,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Add verify code ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),

                  Container(
                    height: 5,
                  ),
                  // Center(
                  //   child: Text(
                  //     "we send a verification code pleas enter it below",
                  //     textAlign: TextAlign.center,
                  //     style: Theme.of(context).textTheme.bodyLarge,
                  //   ),
                  // ),
                  Container(
                    height: 15,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: Colors.deepPurple,
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      controller.code = verificationCode;
                    },
                  ),
                  Container(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.resend();
                    },
                    child: const Center(
                      child: Text(
                        "resend verify code",
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    height: 75,
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        controller.gotosuccess();
                      },
                      color: Colors.deepPurple,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
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
