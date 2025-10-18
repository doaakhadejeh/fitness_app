import 'dart:io';

import 'package:fitnessapp/controller/controlleruser/plan/exprivplancontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/view/screen/user/exercies/playvideo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Expriplan extends StatelessWidget {
  const Expriplan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(Exprivplancontroller());
    return GetBuilder<Exprivplancontroller>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: Text(
            "Exercises for the Day",
            style: TextStyle(
                color: Colors.pink[50],
                fontWeight: FontWeight.w800,
                fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[200],
        ),
        body: Handlingdataview(
          stateerr: controller.stateerr,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
              itemCount: controller.exercises.length,
              itemBuilder: (context, index) {
                final exercise = controller.exercises[index];
                return Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise.description ?? "No description.",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '-recommendedRepeats: ${exercise.recommendedRepeats}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '-restTimeSeconds: ${exercise.restTimeSeconds}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '-sets: ${exercise.sets}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '-note: ${exercise.notes}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            if (exercise.videoUrl.isNotEmpty)
                              VideoPlayerWidget(videoUrl: exercise.videoUrl),
                            // "${Imageconst.imageback}${exercise.videoUrl}"),
                          ],
                        ),

                        const SizedBox(height: 8),
                        if (exercise.videoUrl.toString().isNotEmpty)
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Get.to(() => const VideoPlayerPage(),
                                    arguments: {
                                      "videoUrl": exercise.videoUrl,
                                      "title": exercise.title,
                                      "sets": exercise.sets,
                                      "rest_time_seconds":
                                          exercise.restTimeSeconds,
                                    });
                              },
                              icon: Icon(Icons.play_circle_fill,
                                  color: Colors.deepPurple[900]!),
                              label: Text(
                                "Play Video",
                                style:
                                    TextStyle(color: Colors.deepPurple[900]!),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple[200],
                              ),
                            ),
                          ),
                        const SizedBox(height: 6),
                        // Text(
                        //   "Level: ${exercise.l ?? "-"}",
                        //   style: const TextStyle(
                        //       fontSize: 12, color: Colors.black54),
                        // ),
                      ],
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

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isFile = false;
  bool _hasError = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    // إذا الرابط فاضي من الأساس
    if (widget.videoUrl.isEmpty) {
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
      return;
    }

    try {
      _isFile = File(widget.videoUrl).existsSync();

      _controller = _isFile
          ? VideoPlayerController.file(File(widget.videoUrl))
          : VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

      await _controller.initialize();

      if (!mounted) return;
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _hasError = true;
      });
      if (kDebugMode) {
        print("❌ Video load error: $e");
      }
    }
  }

  @override
  void dispose() {
    if (!_hasError && _isInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "مافي فيديو",
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: SizedBox(
        height: 150,
        width: 140,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(_controller),
              // VideoProgressIndicator(
              //   _controller,
              //   allowScrubbing: true,
              //   colors: VideoProgressColors(
              //     playedColor: Colors.deepPurple[800]!, // اللون اللي بيمشي
              //     backgroundColor: Colors.grey[300]!, // لون الخلفية
              //     bufferedColor: Colors.deepPurple[200]!,
              //   ),
              // ),
              Positioned(
                right: 8,
                bottom: 8,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
