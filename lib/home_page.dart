import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const HomePage({super.key, required String param_homepage});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Video Splash Screen"),
      ),
      body: const Center(
        child: Text("Home Page Body"),
      ),
    );
  }
}