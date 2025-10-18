import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/view/screen/admin/adminhome.dart';
import 'package:fitnessapp/view/screen/admin/trainerhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeA extends StatelessWidget {
  const HomeA({super.key});

  @override
  Widget build(BuildContext context) {
    Services services = Get.find();

    String? role = services.shared.getString("role");

    if (role == "super_admin") {
      return const AdminHome();
    } else if (role == "trainer") {
      return const TrainerHome();
    } else {
      return const Center(child: Text("this role not define!"));
    }
  }
}
