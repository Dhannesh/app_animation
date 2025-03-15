import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsAnimation extends StatefulWidget {
  const PhysicsAnimation({super.key});

  @override
  State<PhysicsAnimation> createState() => _PhysicsAnimationState();
}

class _PhysicsAnimationState extends State<PhysicsAnimation> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late GravitySimulation _simulation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _simulation=GravitySimulation(
        1000.0, //acceleration, pixels per second per square
        0.0, // starting point
        650.0, // end point
        0.0 // starting velocity
    );
    _controller = AnimationController(vsync: this, upperBound: 650)..addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics Simulation'),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width/2 - 50,
            top: _controller.value,
            child: Container(
              width: 100,
              height: 100,
              child: Image.asset("images/stone.png"),
          )
          ),
          Positioned(
            left: 0,
            bottom: -250,
            height: 600,
            width:MediaQuery.of(context).size.width,
            child: Image.asset("images/grass.png"),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.animateWith(_simulation);
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

