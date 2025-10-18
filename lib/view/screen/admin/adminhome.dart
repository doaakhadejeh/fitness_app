import 'package:fitnessapp/controller/controlleradmin/adminhomecontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:fitnessapp/view/screen/admin/screenadmin/addadmin.dart';
import 'package:fitnessapp/view/screen/chat/chatroom.dart';
import 'package:fitnessapp/view/widget/customcardhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Adminhomecontroller());
    return GetBuilder<Adminhomecontroller>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.deepPurple[50],
          appBar: AppBar(
            elevation: 9,
            shadowColor: Colors.indigo,
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => const Chatroom());
                },
                icon: const Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(Approut.setting);
                },
                icon: const Icon(
                  Icons.settings_suggest_sharp,
                  color: Colors.white,
                ),
              ),
            ],
            backgroundColor: Colors.deepPurple[900],
            title: const Text(
              "Admin Dashboard",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Handlingdataview(
            stateerr: Stateerr.none,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  children: [
                    Customcardhome(
                      ontap: () {
                        Get.toNamed(Approut.usermanage);
                      },
                      url: Imageconst.usermanag,
                      text: "User management",
                    ),
                    Customcardhome(
                      ontap: () {
                        Get.toNamed(Approut.trainermang);
                      },
                      url: Imageconst.trainermanag,
                      text: "Trainers management",
                    ),
                    Customcardhome(
                      ontap: () {
                        Get.to(() => const AddAdmin());
                      },
                      url: Imageconst.trainermanag,
                      text: "Admin management",
                    ),
                    Customcardhome(
                      ontap: () {
                        Get.toNamed(Approut.exercies);
                      },
                      url: Imageconst.exercise1,
                      text: "exercies",
                    ),
                    Customcardhome(
                      ontap: () {
                        Get.toNamed(Approut.categories);
                      },
                      url: Imageconst.categories1,
                      text: "categories",
                    ),
                    Customcardhome(
                      url: Imageconst.meal5,
                      ontap: () {
                        Get.toNamed(Approut.meal);
                      },
                      text: "meal",
                    ),
                    Customcardhome(
                      ontap: () {
                        Get.toNamed(Approut.plane);
                      },
                      url: Imageconst.exercise2,
                      text: "plan",
                    ),
                    Customcardhome(
                      ontap: () {
                        Get.toNamed(Approut.mealplan);
                      },
                      url: Imageconst.meal6,
                      text: "meal plan",
                    ),
                  ]),
            ),
          ));
    });
  }
}
