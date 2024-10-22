import 'package:flutter/material.dart';
import 'package:mytodo/animation/SplashScreen.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My todos',
    home: SplashScreen(),
  ));
}