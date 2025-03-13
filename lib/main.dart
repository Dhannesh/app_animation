import 'package:app_animation/animated_container1.dart';
import 'package:app_animation/basic_animation.dart';
import 'package:app_animation/my_animated_container2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.deepOrange),
      home: MyAnimatedContainer2()
    );
  }
}
