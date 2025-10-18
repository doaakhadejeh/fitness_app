import 'package:fitnessapp/controller/controlleruser/homes/homecontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:fitnessapp/view/screen/chat/chatroom.dart';
import 'package:fitnessapp/view/screen/user/exercies/playvideo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homecontroller());
    return GetBuilder<Homecontroller>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Fitness",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const Chatroom());
                  },
                  child: const Icon(
                    Icons.chat_outlined,
                    size: 25,
                    // color: Colors.deepPurple[900],
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 70,
                child: Card(
                  child: TextField(
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        controller.search(value.trim());
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Search..",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.deepPurple[900],
                      ),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ),
            if (controller.searchText.isNotEmpty)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: const Icon(Icons.close, color: Colors.red),
                  label: const Text(" cancle search",
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            const SizedBox(height: 10),
            if (controller.searchText.isEmpty)
              Container(
                height: 180,
                width: 600,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(9, 9),
                        blurRadius: 10,
                        spreadRadius: -3,
                      ),
                    ]),
                child: Stack(children: [
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.deepPurple[800],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "get started with us!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          MaterialButton(
                            onPressed: () {
                              Get.toNamed(Approut.completehelth);
                            },
                            color: Colors.white,
                            shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Text(
                              "Enter my info",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.deepPurple[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    right: 0,
                    child: Image.asset(
                      Imageconst.home9,
                      height: 170,
                      width: 170,
                    ),
                  )
                ]),
              ),
            const SizedBox(height: 14),
            if (controller.searchText.isEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Exercies:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Approut.exrecies);
                    },
                    child: Text(
                      "see all..",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[300]),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 8),
            Handlingdataview(
              stateerr: controller.stateerr,
              child: controller.searchText.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.searchResult.length,
                      itemBuilder: (context, i) {
                        var ex = controller.searchResult[i];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Approut.excat, arguments: {
                              "id": ex['category']['id'],
                              "image":
                                  "${Imageconst.imageback}${ex['category']['image']}",
                              "name": ex['category']['name']
                            });
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              title: Text("${ex['title']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              subtitle:
                                  Text("Category: ${ex['category']['name']}"),
                              leading: const Icon(Icons.fitness_center,
                                  color: Colors.deepPurple),
                              trailing: ex['video_full_url'] != null
                                  ? InkWell(
                                      onTap: () {
                                        Get.to(() => const VideoPlayerPage(),
                                            arguments: {
                                              "videoUrl":
                                                  '${ex['video_full_url']}',
                                              "title": ex['title'],
                                            });
                                      },
                                      child: const Icon(Icons.play_circle_fill,
                                          color: Colors.green),
                                    )
                                  : null,
                            ),
                          ),
                        );
                      },
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1,
                                mainAxisExtent: 170,
                                crossAxisCount: 1,
                              ),
                              itemCount: controller.categories.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(Approut.excat, arguments: {
                                      "id": controller.categories[i]["id"],
                                      "image":
                                          "${Imageconst.imageback}${controller.categories[i]['image']}",
                                      "name": controller.categories[i]["name"]
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          offset: const Offset(7, 7),
                                          blurRadius: 10,
                                          spreadRadius: -10,
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          '${controller.categories[i]['name']}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 20),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            height: 230,
                                            width: 150,
                                            child: Image.network(
                                              "${Imageconst.imageback}${controller.categories[i]['image']}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),

                        /////////////////////////////
                        ///
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Meal:",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Get.to(() => const Nutrition());
                            //   },
                            //   child: Text(
                            //     "see all..",
                            //     style: TextStyle(
                            //         fontSize: 15,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.deepPurple[300]),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 280,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1,
                                mainAxisExtent: 170,
                                crossAxisCount: 1,
                              ),
                              itemCount: controller.meals.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(Approut.mealin, arguments: {
                                      "mealId": controller.meals[i].id,
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          offset: const Offset(7, 7),
                                          blurRadius: 10,
                                          spreadRadius: -10,
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          controller.meals[i].name,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 20),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            height: 200,
                                            width: 150,
                                            child: Image.network(
                                              "${Imageconst.imageback}${controller.meals[i].imagePath}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
            ),
          ]),
        ),
      );
    });
  }
}
