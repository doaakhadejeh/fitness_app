import 'package:fitnessapp/controller/controlleruser/homes/settingcontroller.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Sittingcontrollerimp());
    return GetBuilder<Sittingcontrollerimp>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: Container(
          color: Colors.deepPurple[50],
          child: ListView(children: [
            SizedBox(
              height: 205,
              child: Stack(
                children: [
                  Container(
                    color: Colors.deepPurple[200],
                    height: 160,
                  ),
                  Positioned(
                      top: 85,
                      right: 100,
                      left: 100,
                      child: Icon(
                        // Icons.settings_suggest_sharp,
                        Icons.self_improvement,
                        size: 90,
                        color: Colors.deepPurple[900],
                      )
                      //  CircleAvatar(
                      //   radius: 40,
                      //   backgroundColor: Colors.white,
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(40),
                      //     child: Image.asset(
                      //       Imageconst.i2,
                      //       width: 85,
                      //       height: 85,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // )
                      )
                ],
              ),
            ),
            Container(
              height: 50,
            ),
            Card(
              color: Colors.deepPurple[50],
              child: ListTile(
                tileColor: Colors.deepPurple[50],
                onTap: () {
                  Get.toNamed(Approut.profile);
                },
                trailing: const Icon(Icons.person_2_outlined),
                title: const Text('profile'),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                tileColor: Colors.deepPurple[50],
                onTap: () {
                  Get.toNamed(Approut.aboutas);
                },
                trailing: const Icon(Icons.help_outline),
                title: const Text('About As'),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                tileColor: Colors.deepPurple[50],
                onTap: () {
                  launchUrl(Uri.parse("tel:0958226807"));
                },
                trailing: const Icon(Icons.phone_outlined),
                title: const Text('Contact us'),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                tileColor: Colors.deepPurple[50],
                onTap: () {
                  Get.toNamed(Approut.showhelth);
                },
                trailing: const Icon(Icons.favorite_outline),
                title: const Text('Your Health'),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                tileColor: Colors.deepPurple[50],
                onTap: () {
                  controller.logout();
                },
                trailing: const Icon(Icons.logout),
                title: const Text('Logout'),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
