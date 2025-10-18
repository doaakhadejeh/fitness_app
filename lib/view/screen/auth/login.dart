import 'package:fitnessapp/controller/authcontroller/logincontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/function/exitalert.dart';
import 'package:fitnessapp/core/function/validat.dart';
import 'package:fitnessapp/view/widget/auth/textformfiler.dart';
import 'package:fitnessapp/view/widget/bottomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Logincontrollerimp());
    return PopScope(
      canPop: false,
      onPopInvoked: exitapp,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text("Login"),
          titleTextStyle: Theme.of(context).textTheme.bodySmall,
          centerTitle: true,
        ),
        body: GetBuilder<Logincontrollerimp>(builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: Form(
                key: controller.f,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 10,
                      ),
                      Center(
                        child: SizedBox(
                          child: Icon(
                            Icons.fitness_center,
                            size: 110,
                            color: Colors.deepPurple[200],
                          ),
                          // Image.asset(
                          //   Imageconst.logo,
                          //   height: 150,
                          //   width: 150,
                          //   fit: BoxFit.fill,
                          // )
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          "welcome",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          "Sign in With Email And Password \n And lets start with fitness app!",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Container(
                        height: 40,
                      ),
                      Mytextform(
                          isnumber: false,
                          validat: (val) {
                            return myvalidat(val!, 10, 40, "email");
                          },
                          controller: controller.email,
                          widg: const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          text: "email",
                          hinttext: "add email"),
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
                          text: "password",
                          hinttext: "add password"),
                      Container(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.forgetass();
                            },
                            child: Text(
                              "forget password",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 100,
                      ),
                      Center(
                        child: Bottomlang(
                          text: "login",
                          onPressed: () async {
                            await controller.login();
                          },
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an email ?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          InkWell(
                            onTap: () {
                              controller.gotosignup();
                            },
                            child: Text(
                              "go to sign up",
                              style: TextStyle(
                                  color: Colors.deepPurple[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }
}
