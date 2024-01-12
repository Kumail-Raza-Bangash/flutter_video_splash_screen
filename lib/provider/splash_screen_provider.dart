import 'package:flutter/material.dart';
import 'package:flutter_video_splash_screen/models/onboard_screen.dart';
import 'package:video_player/video_player.dart';

class SplashScreenProvider extends ChangeNotifier {
  late VideoPlayerController _videoPlayerController;
  int currentIndex = 0;

  VideoPlayerController get videoController => _videoPlayerController;

  final List<AllinOnboardModel> _allinOnboardList = [
    AllinOnboardModel(
      "lib/assets/images/designf.jpg",
      "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
      "Prepared by experts",
    ),
    AllinOnboardModel(
      "lib/assets/images/designs.jpg",
      "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
      "Prepared by experts",
    ),
    AllinOnboardModel(
      "lib/assets/images/designt.jpg",
      "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
      "Prepared by experts",
    ),
    // Add other onboarding models here
  ];

  List<AllinOnboardModel> get allinOnboardList => _allinOnboardList;

  SplashScreenProvider() {
    _initializeVideo();
  }

  void _initializeVideo() async {
    try {
      _videoPlayerController = VideoPlayerController.asset('assets/videos/V001.mp4');
      await _videoPlayerController.initialize();
      _videoPlayerController.setLooping(true);
      notifyListeners(); // Notify listeners after initialization
    } catch (e) {
      print('Error initializing video: $e');
    }
  }

  void updateCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
