import 'package:flutter/material.dart';

class MyAnimatedContainer1 extends StatefulWidget {
  const MyAnimatedContainer1({super.key});

  @override
  State<MyAnimatedContainer1> createState() => _AnimatedContainer1State();
}

class _AnimatedContainer1State extends State<MyAnimatedContainer1> {
  Color _color = Colors.redAccent;
  double _width = 50.0;
  double _height = 50.0;
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
            width: _width,
            height: _height,
            duration: Duration(milliseconds: 2500),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            _color = (_color == Colors.redAccent )? Colors.greenAccent : Colors.redAccent;
            _width = (_width == 50.0) ? MediaQuery.of(context).size.width : 50.0;
            _height = (_height == 50.0) ? MediaQuery.of(context).size.height : 50.0;
          });
        },
        child: const Icon(Icons.play_arrow),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
