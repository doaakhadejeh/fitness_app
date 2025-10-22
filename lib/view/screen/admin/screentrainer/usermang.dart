import 'package:fitnessapp/controller/controlleradmin/trainercontrol/viewtrainerusercontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/view/screen/admin/helthprofileuser/showhealthpr.dart';
import 'package:fitnessapp/view/screen/admin/mealplanuser/showplanmeal.dart';
import 'package:fitnessapp/view/screen/admin/planuser/showplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Usermanagt extends StatelessWidget {
  const Usermanagt({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Trainerusercontroller());
    return GetBuilder<Trainerusercontroller>(builder: (controller) {
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
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: controller.data.isEmpty
              ? const Center(child: Text("no user"))
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return SizedBox(
                          height: 160,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
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
                                      Text("#${controller.data[i]["id"]}")
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
                                          controller.toggleSupervisionForUser(
                                              controller.data[i]);
                                        },
                                        icon: Icon(
                                          controller.data[i]["trainer_id"] !=
                                                  null
                                              ? Icons
                                                  .person_remove_alt_1 // إذا مضاف، زر إزالة
                                              : Icons
                                                  .person_add_alt_1, // إذا غير مضاف، زر إضافة
                                          color: Colors.deepPurple,
                                          size: 25,
                                        ),
                                        tooltip: controller.data[i]
                                                    ["trainer_id"] !=
                                                null
                                            ? "Remove from Supervision"
                                            : "Add to Supervision",
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          // عرض الملف الصحي

                                          Get.to(() => ShowHealthProfileUser(
                                              userId: controller.data[i]
                                                  ["id"]));
                                        },
                                        icon: const Icon(
                                            Icons.health_and_safety,
                                            color: Colors.teal),
                                      ),

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
                                      // IconButton(
                                      //     onPressed: () {},
                                      //     icon: Icon(
                                      //       Icons.block,
                                      //       color: Colors.purple,
                                      //       size: 25,
                                      //     )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
        ),
      );
    });
  }
}
