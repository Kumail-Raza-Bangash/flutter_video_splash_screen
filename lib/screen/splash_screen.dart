import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_video_splash_screen/provider/splash_screen_provider.dart';
import 'package:flutter_video_splash_screen/screen/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _textAnimationController;
  late Animation<double> _textOpacity;

  @override
  void initState() {
    super.initState();

    // Initialize video controller and animation controller
    _controller = VideoPlayerController.asset("lib/assets/videos/V001.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        if (mounted) {
          _controller.play();
        }
      });
    });

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the text animation after a delay
    Future.delayed(const Duration(seconds: 1), () {
      _textAnimationController.forward();
    });

    // Navigate to the home page after a delay
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
    _textAnimationController.dispose();
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
                  VideoPlayer(_controller),
                  _getAnimatedText(provider),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getAnimatedText(SplashProvider provider) {
    return AnimatedBuilder(
      animation: _textAnimationController,
      builder: (context, child) {
        return Center(
          child: Opacity(
            opacity: _textOpacity.value,
            child: Text(
              'LIVE WALLPAPER APP',
               style: GoogleFonts.lato( 
               color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                ),
            ),
          ),
        );
      },
    );
  }
}
