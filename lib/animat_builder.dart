import 'package:flutter/material.dart';
import 'dart:math';

class AniBuilder extends StatefulWidget {
  const AniBuilder({super.key});

  @override
  State<AniBuilder> createState() => _AniBuilderState();
}

class _AniBuilderState extends State<AniBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    _animationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("Animation Builder"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext _, child) {
                return Transform.rotate(
                  angle: 2* pi * _animationController.value,
                  child: child,
                );
              },
              child: const SizedBox(
                width: 300,
                height: 300,
                child: Image(
                  image: AssetImage("images/ducky.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          _animationController.forward(); //.repeat(reverse: true);
                        },
                        child: Text('Animate'))),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          _animationController.stop();
                        },
                        child: Text('Stop'))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
