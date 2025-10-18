import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  late SharedPreferences shared;

  Future<Services> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    shared = await SharedPreferences.getInstance();
    return this;
  }
}

initapp() async {
  await Get.putAsync(() => Services().init());
}
