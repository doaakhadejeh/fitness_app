import 'package:fitnessapp/controller/controlleruser/homes/profilecontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/view/screen/user/changeprofileuser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Profilecontroller());
    return GetBuilder<Profilecontroller>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "My Profile",
              style: TextStyle(
                  color: Colors.deepPurple[800], fontWeight: FontWeight.w800),
            ),
            backgroundColor: Colors.deepPurple[50],
            // backgroundColor: Colors.deepPurple[800],
          ),
          backgroundColor: Colors.deepPurple[50],
          body: Handlingdataview(
            stateerr: controller.stateerr,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                  ),
                  Card(
                    color: Colors.deepPurple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading:
                          Icon(Icons.person, color: Colors.deepPurple[800]),
                      title: Text(
                        controller.name ?? "name not found",
                        style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    color: Colors.deepPurple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.deepPurple[800]),
                      title: Text(
                        controller.email ?? "email not found",
                        style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    color: Colors.deepPurple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.phone, color: Colors.deepPurple[800]),
                      title: Text(
                        controller.phone ?? "number not found",
                        style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[800],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => const Changprofileuser());
                    },
                    icon: Icon(Icons.edit, color: Colors.deepPurple[50]),
                    label: Text(
                      "change profile ",
                      style:
                          TextStyle(color: Colors.deepPurple[50], fontSize: 16),
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
