import 'package:fitnessapp/controller/controlleradmin/admincontrol/viewadminusercontroller.dart';
import 'package:fitnessapp/view/screen/admin/helthprofileuser/showhealthpr.dart';
import 'package:fitnessapp/view/screen/admin/mealplanuser/showplanmeal.dart';
import 'package:fitnessapp/view/screen/admin/planuser/showplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Usermanag extends StatelessWidget {
  const Usermanag({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Adminusercontroller());
    return GetBuilder<Adminusercontroller>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[50],
          title: const Text(
            "User Manag",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                controller.getuser();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, i) {
                final user = controller.data[i];
                final isBlocked = user["is_blocked"];
                return controller.data[i] == null
                    ? const Text("Not found user")
                    : SizedBox(
                        height: 160,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "user name: ${controller.data[i]["name"]}"),
                                    Text("# ${controller.data[i]["id"]}")
                                  ],
                                ),
                                Container(
                                  height: 10,
                                ),
                                Text("email: ${controller.data[i]["email"]}"),
                                Container(
                                  height: 10,
                                ),
                                Text(
                                    "phone: ${controller.data[i]["phone_number"]}"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // IconButton(
                                    //     onPressed: () {},
                                    //     icon: const Icon(
                                    //       Icons.edit,
                                    //       color: Colors.green,
                                    //       size: 25,
                                    //     )),
                                    IconButton(
                                        onPressed: () {
                                          controller.deleteuser(
                                              '${controller.data[i]["id"]}');
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 25,
                                        )),
                                    IconButton(
                                      onPressed: () {
                                        controller.toggleBlockUser(i);
                                      },
                                      icon: Icon(
                                        Icons.block,
                                        color: isBlocked == true
                                            ? Colors.pink
                                            : Colors.deepPurple,
                                        size: 25,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        // عرض الملف الصحي

                                        Get.to(() => ShowHealthProfileUser(
                                            userId: controller.data[i]["id"]));
                                      },
                                      icon: const Icon(Icons.health_and_safety,
                                          color: Colors.teal),
                                    ),

                                    // const SizedBox(
                                    //   width: 6,
                                    // ),
                                    IconButton(
                                      onPressed: () {
                                        // عرض الخطة الغذائية
                                        Get.to(() => const MealPlanUserPage(),
                                            arguments: {
                                              "id": controller.data[i]["id"]
                                            });
                                      },
                                      icon: const Icon(Icons.restaurant,
                                          color: Colors.orange),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        // عرض خطة التمارين
                                        Get.to(() => const PlanUser(),
                                            arguments: {
                                              "id": controller.data[i]["id"]
                                            });
                                      },
                                      icon: const Icon(Icons.fitness_center,
                                          color: Colors.blue),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
              }),
        ),
      );
    });
  }
}
