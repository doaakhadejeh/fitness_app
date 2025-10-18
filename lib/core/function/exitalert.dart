import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

exitapp(bool didpop) {
  if (didpop) {
    return;
  }
  try {
    return Get.defaultDialog(
        cancel: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                    side: const BorderSide(color: Colors.deepPurple))),
            child: const Text(
              "cancel",
              style: TextStyle(color: Colors.deepPurple),
            )),
        confirm: ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                    side: const BorderSide(color: Colors.blue))),
            child: const Text(
              "ok",
              style: TextStyle(color: Colors.white),
            )),
        content: const Text(
          "Are you shure exit app",
          style: TextStyle(fontSize: 15),
        ),
        title: "Alert",
        titleStyle: const TextStyle(color: Colors.deepPurple));
  } catch (e) {
    // ignore: avoid_print
    print("================================$e");
  }
}
