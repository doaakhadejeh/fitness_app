import 'package:fitnessapp/controller/controlleradmin/planuser/updateplanusercontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddplanUser extends StatelessWidget {
  const AddplanUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Addplanusercontroller());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        foregroundColor: Colors.white,
        title: const Text("Assign Plan to User"),
        centerTitle: true,
      ),
      body: GetBuilder<Addplanusercontroller>(builder: (controller) {
        return Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: "Select Plan",
                    border: OutlineInputBorder(),
                  ),
                  items: controller.allPlans.map((plan) {
                    return DropdownMenuItem(
                      value: plan.id,
                      child: Text(plan.title),
                    );
                  }).toList(),
                  onChanged: (val) {
                    controller.selectedPlanId = val;
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.startDate,
                  decoration: const InputDecoration(
                    labelText: "Start Date (YYYY-MM-DD)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.endDate,
                  decoration: const InputDecoration(
                    labelText: "End Date (YYYY-MM-DD)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[800],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                  ),
                  onPressed: () {
                    controller.assignPlan();
                  },
                  child: const Text(
                    "Assign Plan",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
