import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _visible = true;

  bool get visible => _visible;

  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }
}