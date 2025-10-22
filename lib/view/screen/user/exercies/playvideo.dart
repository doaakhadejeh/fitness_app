import 'package:fitnessapp/controller/controlleruser/exercies/videocontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final title = args["title"] ?? "Exercise Video";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: GetBuilder<VideoController>(
        init: VideoController(),
        builder: (controller) {
          if (controller.hasError) {
            return const Center(
              child: Text(
                "No video available",
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (!controller.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          final vc = controller.videoPlayerController!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 400,
                    width: 350,
                    child: AspectRatio(
                      aspectRatio: vc.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(vc),
                          // VideoProgressIndicator(
                          //   vc,
                          //   allowScrubbing: true,
                          //   colors: VideoProgressColors(
                          //     playedColor: Colors.deepPurple[800]!,
                          //     backgroundColor: Colors.grey[300]!,
                          //     bufferedColor: Colors.deepPurple[200]!,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: controller.togglePlayPause,
                  icon:
                      Icon(vc.value.isPlaying ? Icons.pause : Icons.play_arrow),
                  label: Text(vc.value.isPlaying ? "Pause" : "Play"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // ✅ Sets card
                if (controller.sets != null)
                  Card(
                    color: Colors.deepPurple[50],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.fitness_center,
                          color: Colors.deepPurple),
                      title: Text("Remaining sets: ${controller.sets}"),
                      trailing: ElevatedButton(
                        onPressed: controller.completeSet,
                        child: const Text("✓ Done"),
                      ),
                    ),
                  ),

                // ✅ Rest timer card
                if (controller.restTime != null)
                  Card(
                    color: Colors.orange[50],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.timer, color: Colors.orange),
                      title: Text(controller.remainingSeconds > 0
                          ? "Rest: ${controller.remainingSeconds} sec"
                          : "Press ✓ after each set to start the timer"),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
