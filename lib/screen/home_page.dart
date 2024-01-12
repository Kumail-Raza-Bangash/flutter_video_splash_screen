// home_page.dart

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, String? param_homepage});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your custom picture, video, and gif widgets here
          ],
        ),
      ),
    );
  }
}
