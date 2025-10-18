import 'package:fitnessapp/controller/controlleruser/homes/mealcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:fitnessapp/view/screen/user/meal/mealingredient.dart';
import 'package:fitnessapp/view/screen/user/meal/mealplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nutrition extends StatelessWidget {
  const Nutrition({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Mealcontroller());
    return GetBuilder<Mealcontroller>(builder: (controller) {
      return Scaffold(
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Healthy meals: ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const UserMealPlansPage());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child: const Text(
                        "meal plans",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.meals.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Get.bottomSheet(BottomSheet(
                              onClosing: () {},
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 40),
                                  child: Text(
                                    "${controller.meals[i].description}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 20),
                                  ),
                                );
                              },
                            ));
                          },
                          child: Card(
                            surfaceTintColor: Colors.deepPurple[100],
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 20),
                            elevation: 5,
                            shadowColor: Colors.deepPurple[300],
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      "${Imageconst.imageback}${controller.meals[i].imagePath}",
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        controller.meals[i].name,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Container(
                                        width: 5,
                                      ),

                                      Text(
                                        " protin: ${controller.meals[i].protein}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "carbs: ${controller.meals[i].carbs}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "quantityGrams :${controller.meals[i].quantityGrams}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "healthyFats: ${controller.meals[i].healthyFats}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      // Container(
                                      //   width: 5,
                                      // ),
                                      // Text(
                                      //   "carbs: ${controller.meals[i].carbs}",
                                      //   style: const TextStyle(
                                      //       color: Colors.grey,
                                      //       fontWeight: FontWeight.w600),
                                      // ),
                                      Container(
                                        width: 5,
                                      ),
                                      Text(
                                        "calories: ${controller.meals[i].calories}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(
                                              () => const MealIngredientsPage(),
                                              arguments: {
                                                'mealId':
                                                    controller.meals[i].id,
                                              });
                                        },
                                        child: const Text(
                                          "show  ingrediend!",
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
