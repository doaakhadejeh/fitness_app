import 'package:fitnessapp/binding.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/rout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initapp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Initialbinding(),
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      getPages: route,
      initialRoute: "/",
    );
  }
}
