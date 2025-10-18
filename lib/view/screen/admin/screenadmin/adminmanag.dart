import 'package:fitnessapp/controller/controlleradmin/admincontrol/admincontroller.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adminmanag extends StatelessWidget {
  const Adminmanag({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Adminadmincontroller());
    return GetBuilder<Adminadmincontroller>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(side: BorderSide(color: Colors.white)),
          onPressed: () {
            Get.toNamed(Approut.addtrainer);
          },
          backgroundColor: Colors.deepPurple[200],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[50],
          title: const Text(
            "Admin Manag",
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
                return controller.data[i] == null
                    ? const Text(" ")
                    : SizedBox(
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
                                        "admin name: ${controller.data[i]["name"]}"),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                          controller.deletetrainer(
                                              controller.data[i]["id"]);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 25,
                                        )),
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
      );
    });
  }
}
