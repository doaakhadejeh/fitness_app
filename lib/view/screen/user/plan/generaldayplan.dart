import 'package:fitnessapp/controller/controlleruser/plan/generaldayplancontroller.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';

class Generaldayplan extends StatelessWidget {
  const Generaldayplan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Generalplandaycontroller());

    return GetBuilder<Generalplandaycontroller>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: const Text(
            "Plan Days",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[50],
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 7, mainAxisSpacing: 5),
              itemCount: controller.days.length,
              itemBuilder: (context, index) {
                final day = controller.days[index];
                return InkWell(
                  onTap: () {
                    // هنا ممكن تضيفي التوجه لصفحة تمارين اليوم مع تمرير بيانات اليوم
                    Get.toNamed(Approut.expriplan,
                        arguments: {"DayId": day.id});
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            "Day : ${day.dayNumber}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            day.exercises != null && day.exercises!.isNotEmpty
                                ? "Exercises: ${day.exercises!.length}"
                                : "No exercises",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
