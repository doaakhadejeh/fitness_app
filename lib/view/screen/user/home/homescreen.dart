import 'package:fitnessapp/controller/controlleruser/homes/homescreencontroller.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/exitalert.dart';
import 'package:fitnessapp/view/widget/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homescreencontrollerimp());
    return GetBuilder<Homescreencontrollerimp>(builder: (controller1) {
      return PopScope(
        canPop: false,
        onPopInvoked: exitapp,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple[800],
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            onPressed: () {
              Get.offNamed(Approut.geplan);
            },
            child: const Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.deepPurple[100],
            height: 76,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(controller1.mylist.length + 1, (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : Custombuttonappbar(
                          name: controller1.titleappbar[i],
                          icon: controller1.iconappar[i],
                          colorselect: Colors.white,
                          onPressed: () {
                            controller1.getindex(i);
                          },
                          active: controller1.currentindex == i ? true : false,
                        );
                })
              ],
            ),
          ),
          body: controller1.mylist.elementAt(controller1.currentindex),
        ),
      );
    });
  }
}
