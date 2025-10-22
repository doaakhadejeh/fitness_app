import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text("success"),
        titleTextStyle: const TextStyle(color: Colors.deepPurple),
        centerTitle: true,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 70),
          const Icon(
            Icons.check_circle_outline,
            color: Colors.deepPurple,
            size: 200,
          ),
          Container(
            height: 10,
          ),
          const Text(
            "reset password success you can now login with new password",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          const Spacer(),
          MaterialButton(
            onPressed: () {
              Get.offAll(() => const Login());
            },
            color: Colors.deepPurple,
            shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: const Text(
              "login",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
