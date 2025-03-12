import 'package:app_animation/basic_animation.dart';
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
      home: Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        title: const Text("My First Animation"),
      ),
        body: BasicAnimation(),
      ),
    );
  }
}
