import 'package:fitnessapp/controller/controlleradmin/exercies/exerciescontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ExerciesController());
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text("Exercises"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[50],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Get.find<ExerciesController>().getExercises();
            },
          ),
        ],
      ),
      body: GetBuilder<ExerciesController>(
        builder: (controller) {
          return Handlingdatarequest(
            stateerr: controller.stateerr,
            child: controller.exercises.isEmpty
                ? const Center(
                    child: Text(
                      "No exercises found.",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = controller.exercises[index];

                      return Card(
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exercise.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 6),
                              if (exercise.videoUrl.isNotEmpty)
                                VideoPlayerWidget(
                                    videoUrl:
                                        "${Imageconst.imageback}${exercise.videoUrl}"),
                              const SizedBox(height: 6),
                              Text(
                                exercise.description ?? "",
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Access: ${exercise.accessType ?? "-"}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                "Category: ${exercise.category?.name ?? "-"}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  exercise.accessType == "public"
                                      ? Icons.public
                                      : Icons.lock,
                                  color: Colors.deepPurple.shade800,
                                ),
                              ),
                              const SizedBox(height: 4),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple.shade800,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  controller
                                      .deleteexercies(exercise.id.toString());
                                },
                                child: const Text(
                                  "delete",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "addex",
        backgroundColor: Colors.deepPurple[800],
        onPressed: () {
          Get.toNamed(Approut.addexercies);
        },
        child: Icon(
          Icons.add,
          color: Colors.purple[50],
        ),
      ),
    );
  }
}

// Widget لعرض الفيديو

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
    try {
      _isFile = File(widget.videoUrl).existsSync();

      _controller = _isFile
          ? VideoPlayerController.file(File(widget.videoUrl))
          : VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

      await _controller.initialize();

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
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
          "⚠️ Failed to load video.",
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
        height: 130,
        width: 260,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(_controller),
              // VideoProgressIndicator(_controller, allowScrubbing: true),
              Positioned(
                right: 8,
                bottom: 8,
                child: IconButton(
                  // backgroundColor: Colors.black54,
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    }
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
