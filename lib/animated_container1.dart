import 'package:flutter/material.dart';

class MyAnimatedContainer1 extends StatefulWidget {
  const MyAnimatedContainer1({super.key});

  @override
  State<MyAnimatedContainer1> createState() => _AnimatedContainer1State();
}

class _AnimatedContainer1State extends State<MyAnimatedContainer1> {
  Color _color = Colors.redAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          title: const Text("Implicit Animation"),
        ),
        body: Center(
          child: AnimatedContainer(
            color: _color,
            duration: Duration(milliseconds: 2500),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            _color = (_color == Colors.redAccent )? Colors.greenAccent : Colors.redAccent;
          });
        },
        child: const Icon(Icons.play_arrow),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
