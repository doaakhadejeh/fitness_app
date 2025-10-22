import 'package:fitnessapp/controller/controlleruser/exercies/categoriescontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Exercises extends StatelessWidget {
  const Exercises({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return GetBuilder<CategoriesController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.deepPurple[800]!.withOpacity(0.9),
                        )),
                    Container(
                      width: 30,
                    ),
                    Text(
                      "Exercise Categories",
                      style: TextStyle(
                        shadows: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[800]!.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Approut.excat, arguments: {
                            "id": category["id"],
                            "name": category["name"],
                            "image":
                                "${Imageconst.imageback}${category['image']!}"
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Hero(
                                tag: category['id']!,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "${Imageconst.imageback}${category['image']!}",
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                left: 10,
                                right: 10,
                                child: Text(
                                  category['name']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
