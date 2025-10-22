import 'package:fitnessapp/controller/controlleradmin/settingcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Changprofile extends StatelessWidget {
  const Changprofile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Settingcontroller());
    return GetBuilder<Settingcontroller>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,

          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "change Profile",
              style: TextStyle(
                  color: Colors.deepPurple[800], fontWeight: FontWeight.w800),
            ),
            // backgroundColor: Colors.deepPurple[50],
            // backgroundColor: Colors.deepPurple[800],
          ),
          // backgroundColor: Colors.deepPurple[50],
          body: Handlingdataview(
            stateerr: controller.stateerr,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                  ),
                  Card(
                    // color: Colors.deepPurple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller.name,
                      decoration: InputDecoration(
                        hintText: "change your name",
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.deepPurple[900],
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[800],
                      foregroundColor: Colors.white.withOpacity(0.9),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      controller.updateprofile();
                    },
                    icon: const Icon(Icons.done),
                    label: const Text(
                      "save",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const Divider(height: 60),
                  const Text(
                    "change your password:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    // color: Colors.deepPurple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        hintText: "add old password",
                        prefixIcon: Icon(
                          Icons.password,
                          size: 30,
                          color: Colors.deepPurple[900],
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    // color: Colors.deepPurple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller.newpassord,
                      decoration: InputDecoration(
                        hintText: "add new password",
                        prefixIcon: Icon(
                          Icons.password,
                          size: 30,
                          color: Colors.deepPurple[900],
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    // color: Colors.deepPurple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller.confpassword,
                      decoration: InputDecoration(
                        hintText: "confirm new password",
                        prefixIcon: Icon(
                          Icons.password,
                          size: 30,
                          color: Colors.deepPurple[900],
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[800],
                      foregroundColor: Colors.white.withOpacity(0.9),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      controller.changepassword();
                    },
                    icon: const Icon(Icons.done),
                    label: const Text(
                      "save",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
