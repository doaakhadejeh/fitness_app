import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:flutter/services.dart'; // for sound & vibration

class VideoController extends GetxController {
  VideoPlayerController? videoPlayerController;
  bool isInitialized = false;
  bool hasError = false;

  int? sets;
  int? restTime;
  int remainingSeconds = 0;
  Timer? restTimer;
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments ?? {};
    final videoUrl = (args["videoUrl"] as String?) ?? "";
    sets = args["sets"];
    restTime = args["rest_time_seconds"];

    if (videoUrl.isEmpty) {
      hasError = true;
      update();
      return;
    }

    try {
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(videoUrl));

      videoPlayerController!.initialize().then((_) {
        isInitialized = true;
        update();
        videoPlayerController!.play();

        // ✅ خلي الفيديو يعيد نفسه طول ما التايمر ما خلص
        videoPlayerController!.addListener(() {
          final vc = videoPlayerController!;
          if (vc.value.position >= vc.value.duration) {
            if (remainingSeconds > 0) {
              vc.seekTo(Duration.zero);
              vc.play();
            } else {
              stopVideo(); // لما يخلص التايمر يوقف
            }
          }
        });
      }).catchError((_) {
        hasError = true;
        update();
      });
    } catch (_) {
      hasError = true;
      update();
    }
  }

  /// Play / Pause toggle
  void togglePlayPause() {
    final vc = videoPlayerController;
    if (vc == null) return;
    if (vc.value.isPlaying) {
      vc.pause();
    } else {
      vc.play();
    }
    update();
  }

  /// Stop video (pause + reset to start)
  void stopVideo() {
    final vc = videoPlayerController;
    if (vc == null) return;
    vc.pause();
    vc.seekTo(Duration.zero);
    update();
  }

  /// Start rest timer
  void startRestTimer() {
    if (restTime == null) return;

    remainingSeconds = restTime!;
    restTimer?.cancel();

    restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        update();
      } else {
        timer.cancel();

        // ✅ vibration + sound
        HapticFeedback.vibrate();
        SystemSound.play(SystemSoundType.click);

        // ✅ stop video automatically
        stopVideo();
      }
    });

    update();
  }

  /// Decrease sets & start rest if available
  void completeSet() {
    if (sets == null) return;

    if (sets! > 0) {
      sets = sets! - 1;
      if (restTime != null) {
        startRestTimer();
      }
      update();
    }
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    restTimer?.cancel();
    super.onClose();
  }
}
