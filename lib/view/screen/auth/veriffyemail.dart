import 'package:fitnessapp/controller/authcontroller/vryifyemailcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Veryfiyemail extends StatelessWidget {
  const Veryfiyemail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Verifiemailcontroller());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("verify email"),
        titleTextStyle: Theme.of(context).textTheme.bodySmall,
        centerTitle: true,
      ),
      body: GetBuilder<Verifiemailcontroller>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                height: 50,
              ),
              Center(
                child: Text(
                  "Add verify code ",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Container(
                height: 5,
              ),
              Center(
                child: Text(
                  "we send a verification code pleas enter it below",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                height: 50,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.deepPurple,
                showFieldAsBox: true,
                onSubmit: (String verificationCode) {
                  controller.gotosuccess(verificationCode);
                },
              ),
              Container(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.resend();
                },
                child: const Center(
                  child: Text(
                    "resend verify code",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
