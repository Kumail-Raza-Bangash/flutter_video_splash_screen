import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_video_splash_screen/provider/splash_screen_provider.dart';
import 'package:flutter_video_splash_screen/screen/home_page.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPageProvider(),
    );
  }
}

class SplashPageProvider extends StatefulWidget {
  @override
  _SplashPageProviderState createState() => _SplashPageProviderState();
}

class _SplashPageProviderState extends State<SplashPageProvider> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("lib/assets/videos/V002.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        if (mounted) {
          _controller.play();
        }
      });
    });

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (e) => false,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: Consumer<SplashProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            body: Center(
              child: Stack(
                children: <Widget>[
                  _getVideoBackground(provider),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getVideoBackground(SplashProvider provider) {
    return AnimatedOpacity(
      opacity: provider.visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: VideoPlayer(_controller),
    );
  }
}


