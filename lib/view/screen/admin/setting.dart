import 'package:fitnessapp/controller/controlleradmin/settingcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/view/screen/admin/changeprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settingadmintr extends StatelessWidget {
  const Settingadmintr({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Settingcontroller());
    return GetBuilder<Settingcontroller>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "My Profile",
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          body: Handlingdataview(
            stateerr: controller.stateerr,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: 150),
                  Card(
                    color: Colors.deepPurple[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.white),
                      title: Text(
                        controller.name1 ?? "name not found",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    color: Colors.deepPurple[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.email, color: Colors.white),
                      title: Text(
                        controller.email1 ?? "email not found",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),

                  /// الأزرار
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.logout(),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout,
                                    color: Colors.deepPurple[800]),
                                const SizedBox(width: 6),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: Colors.deepPurple[800],
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.to(() => const Changprofile()),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.edit, color: Colors.deepPurple[800]),
                                const SizedBox(width: 6),
                                Text(
                                  "Change Profile",
                                  style: TextStyle(
                                    color: Colors.deepPurple[800],
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
