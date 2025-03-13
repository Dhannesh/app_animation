import 'package:flutter/material.dart';

class MyAnimatedContainer2 extends StatefulWidget {
  const MyAnimatedContainer2({super.key});

  @override
  State<MyAnimatedContainer2> createState() => _MyAnimatedContainer2State();
}

class _MyAnimatedContainer2State extends State<MyAnimatedContainer2> {

  double _width = 100.0;
  double _height = 100.0;
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
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  const DecorationImage(image: AssetImage("images/tie.jpg"))),
          duration: Duration(milliseconds: 2500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width =
                (_width == 100.0) ? MediaQuery.of(context).size.width : 100.0;
            _height =
                (_height == 100.0) ? MediaQuery.of(context).size.height : 100.0;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
