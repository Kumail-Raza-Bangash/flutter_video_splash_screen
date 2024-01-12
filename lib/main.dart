import 'package:flutter/material.dart';
import 'package:flutter_video_splash_screen/provider/splash_screen_provider.dart';
import 'package:flutter_video_splash_screen/screen/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        // Add more providers if needed
      ],
      child: MaterialApp(
        title: 'Flutter Video Splash Screen',
        home: SplashPage(),
      ),
    );
  }
}
