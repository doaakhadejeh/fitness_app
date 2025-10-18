import 'dart:io';

import 'package:fitnessapp/controller/controlleruser/exercies/excatcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:fitnessapp/view/screen/user/exercies/playvideo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Exercat extends StatelessWidget {
  const Exercat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Excatcontroller());
    return GetBuilder<Excatcontroller>(builder: (controller) {
      return Scaffold(
          body: Handlingdataview(
        stateerr: controller.stateerr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 225,
              child: Stack(
                children: [
                  Container(
                    color: Colors.deepPurple[100],
                    height: 170,
                  ),
                  Positioned(
                      top: 70,
                      right: 100,
                      left: 100,
                      child: Hero(
                        tag: controller.id!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            controller.image!,
                            height: 250,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Text(
              controller.name!,
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: controller.exercises.isEmpty
                  ? const Center(
                      child: Text(
                        "No exercises found.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = controller.exercises[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            elevation: 6,
                            shadowColor: Colors.deepPurple,
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        exercise.title,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        exercise.description ??
                                            "No description.",
                                        style: const TextStyle(fontSize: 13),
                                      ),

                                      const SizedBox(height: 30),
                                      if (exercise.videoUrl.isNotEmpty)
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Get.to(
                                                () => const VideoPlayerPage(),
                                                arguments: {
                                                  "videoUrl":
                                                      '${Imageconst.imageback}${exercise.videoUrl}',
                                                  "title": exercise.title,
                                                });
                                          },
                                          icon: Icon(Icons.play_circle_fill,
                                              color: Colors.deepPurple[900]!),
                                          label: Text(
                                            "Play Video",
                                            style: TextStyle(
                                                color: Colors.deepPurple[900]!),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.deepPurple[200],
                                          ),
                                        ),
                                      // const SizedBox(height: 6),
                                      // Text(
                                      //   "Level: ${exercise. ?? '-'}",
                                      //   style: const TextStyle(
                                      //       fontSize: 12,
                                      //       color: Colors.black54),
                                      // ),
                                    ],
                                  ),
                                  if (exercise.videoUrl.isNotEmpty)
                                    VideoPlayerWidget(
                                        videoUrl:
                                            "${Imageconst.imageback}${exercise.videoUrl}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ));
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
        height: 100,
        width: 90,
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
