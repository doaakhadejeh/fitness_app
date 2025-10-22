import 'package:fitnessapp/controller/controlleruser/homes/settingcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Changprofileuser extends StatelessWidget {
  const Changprofileuser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Sittingcontrollerimp());
    return GetBuilder<Sittingcontrollerimp>(
      builder: (controller) {
        return Scaffold(
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
                    // color: Colors.deepPurple[200],
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
                  Card(
                    // color: Colors.deepPurple[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller.phone,
                      decoration: InputDecoration(
                        hintText: "change your phone",
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 30,
                          color: Colors.deepPurple[900],
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[900],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      controller.updateprofile();
                    },
                    icon: const Icon(Icons.done, color: Colors.white),
                    label: const Text(
                      "save",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Divider(),
                  const SizedBox(height: 5),
                  const Text(
                    "change your password:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Card(
                    // color: Colors.deepPurple[200],
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
                  const SizedBox(height: 5),
                  Card(
                    // color: Colors.deepPurple[200],
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
                  const SizedBox(height: 5),
                  Card(
                    // color: Colors.deepPurple[200],
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
                  Container(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[900],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      controller.changepassword();
                    },
                    icon: const Icon(Icons.done, color: Colors.white),
                    label: const Text(
                      "save",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
