import 'package:fitnessapp/controller/controlleruser/homes/progresscontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class Progressyou extends StatelessWidget {
  const Progressyou({super.key});

  @override
  Widget build(BuildContext context) {
    final purple200 = Colors.deepPurple[200];
    final purple800 = Colors.deepPurple[800];

    Get.put(Progresscontroller());

    return GetBuilder<Progresscontroller>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: purple200!.withOpacity(0.1),
          body: Handlingdatarequest(
            stateerr: controller.stateerr,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: purple200.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello, ${controller.username ?? '--'}",
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          const SizedBox(height: 8),
                          // Text(controller.encouragementMessage,
                          //     style: const TextStyle(
                          //         fontSize: 16, color: Colors.black87)),
                          const Text("Small steps matter, keep going!",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text("Weight Progress",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 15),
                    controller.hasWeightHistory
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 0, bottom: 8, right: 40),
                            child: SizedBox(
                                height: 200,
                                child: LineChart(
                                  LineChartData(
                                    gridData: FlGridData(
                                      show: true,
                                      drawVerticalLine: false,
                                      getDrawingHorizontalLine: (value) =>
                                          FlLine(
                                        color: Colors.grey.shade300,
                                        strokeWidth: 1,
                                      ),
                                    ),
                                    titlesData: FlTitlesData(
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 30,
                                          interval: 2,
                                          getTitlesWidget: (value, meta) {
                                            return Text("${value.toInt()}kg",
                                                style: const TextStyle(
                                                    fontSize: 10));
                                          },
                                        ),
                                      ),
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 50,
                                          interval: 1,
                                          getTitlesWidget: (value, meta) {
                                            int index = value.toInt();
                                            if (index <
                                                controller
                                                    .weightHistory.length) {
                                              String date = controller
                                                  .weightHistory[index]['date']
                                                  .toString();
                                              try {
                                                date = DateFormat("MM-dd")
                                                    .format(
                                                        DateTime.parse(date));
                                                // ignore: empty_catches
                                              } catch (e) {}
                                              return Text(date,
                                                  style: const TextStyle(
                                                      fontSize: 10));
                                            }
                                            return const Text("");
                                          },
                                        ),
                                      ),
                                      topTitles: const AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: false)),
                                      rightTitles: const AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: false)),
                                    ),
                                    borderData: FlBorderData(
                                      show: true,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                    ),
                                    minX: controller.weightHistory
                                            .map((e) =>
                                                double.tryParse(
                                                    e['weight'].toString()) ??
                                                0.0)
                                            .reduce((a, b) => a < b ? a : b) -
                                        2,
                                    maxX: controller.weightHistory
                                            .map((e) =>
                                                double.tryParse(
                                                    e['weight'].toString()) ??
                                                0.0)
                                            .reduce((a, b) => a > b ? a : b) +
                                        2,
                                    minY: 0,
                                    maxY: controller.weightHistory.length
                                        .toDouble(),
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: controller.weightHistory
                                            .asMap()
                                            .entries
                                            .map((e) => FlSpot(
                                                  double.tryParse(e
                                                          .value['weight']
                                                          .toString()) ??
                                                      0.0, // X = الوزن
                                                  e.key
                                                      .toDouble(), // Y = التاريخ (index)
                                                ))
                                            .toList(),
                                        isCurved: true,
                                        gradient: LinearGradient(
                                            colors: [purple800!, purple200]),
                                        barWidth: 3,
                                        belowBarData: BarAreaData(
                                          show: true,
                                          gradient: LinearGradient(
                                            colors: [
                                              purple800.withOpacity(0.3),
                                              purple200.withOpacity(0.1)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        dotData: const FlDotData(show: true),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        : Center(
                            child: Container(
                                padding: const EdgeInsets.all(70),
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: const Text("No weight data available"))),
                    const SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        leading: Icon(Icons.monitor_weight, color: purple800),
                        title: Text(
                            "Current Weight: ${controller.currentWeight ?? '--'} kg"),
                        subtitle: Text("Goal: ${controller.goal ?? '--'}"),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(16)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Text("Workout this week",
                    //             style: TextStyle(fontWeight: FontWeight.bold)),
                    //         const SizedBox(height: 8),
                    //         LinearPercentIndicator(
                    //           lineHeight: 14.0,
                    //           percent: controller.workoutPercent ?? 0.0,
                    //           backgroundColor: Colors.grey[300],
                    //           progressColor: purple800,
                    //           center: Text(
                    //               "${((controller.workoutPercent ?? 0.0) * 100).toInt()}%",
                    //               style: const TextStyle(
                    //                   fontSize: 12, color: Colors.white)),
                    //           barRadius: const Radius.circular(10),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 12),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(16)),
                    //   child: ListTile(
                    //     leading: Icon(Icons.restaurant, color: purple800),
                    //     title: const Text("Healthy meals"),
                    //     subtitle: const Text("-- / 7 days"),
                    //   ),
                    // ),
                    // const SizedBox(height: 12),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(16)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text("Level: ${controller.userLevel ?? '--'}",
                    //                 style: const TextStyle(
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.bold)),
                    //             Text(
                    //                 "Last update: ${controller.lastUpdate ?? '--'}",
                    //                 style: const TextStyle(
                    //                     fontSize: 12, color: Colors.black54)),
                    //           ],
                    //         ),
                    //         const SizedBox(height: 8),
                    //         LinearPercentIndicator(
                    //           lineHeight: 14.0,
                    //           percent: controller.levelProgress ?? 0.0,
                    //           backgroundColor: Colors.grey[300],
                    //           progressColor: purple800,
                    //           barRadius: const Radius.circular(10),
                    //           center: Text(
                    //               "${((controller.levelProgress ?? 0.0) * 100).toInt()}%",
                    //               style: const TextStyle(
                    //                   fontSize: 12, color: Colors.white)),
                    //         ),
                    //         const SizedBox(height: 6),
                    //         const Text("Progress to next level",
                    //             style: TextStyle(
                    //                 fontSize: 12, color: Colors.black54)),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 12),
                    const Text("Measurements comparison",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    controller.hasBodyMeasurements
                        ? Column(
                            children: controller.bodyMeasurements.map((item) {
                              Color color = Colors.black;
                              String statusIcon = '';
                              if (item['current'] < item['previous']) {
                                statusIcon = '↓';
                                color = Colors.green;
                              } else if (item['current'] > item['previous']) {
                                statusIcon = '↑';
                                color = Colors.red;
                              } else {
                                statusIcon = '–';
                                color = Colors.grey;
                              }

                              return Card(
                                child: ListTile(
                                  leading: Icon(Icons.accessibility_new,
                                      color: purple800),
                                  title: Text(
                                      "${item['part']}: ${item['current']} cm",
                                      style: TextStyle(color: color)),
                                  subtitle: Text(
                                      "Previous: ${item['previous']} cm  $statusIcon",
                                      style: TextStyle(color: color)),
                                ),
                              );
                            }).toList(),
                          )
                        : const Text("No body measurements available."),
                    // const SizedBox(height: 16),
                    // Center(
                    //     child: Text(
                    //   controller.encouragementMessage,
                    //   style: TextStyle(
                    //       backgroundColor: purple200.withOpacity(0.2)),
                    // )),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
