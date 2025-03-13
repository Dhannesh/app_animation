import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  const BasicAnimation({super.key});

  @override
  State<BasicAnimation> createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation> {
  double _side = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Center(
          child: AnimatedContainer(
            width: _side,
            height: _side,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.cyan),
            duration: const Duration(milliseconds: 1000),
          ),
        )),
        Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                      child: Text('Shrink'),
                      onPressed: () {
                        setState(() {
                          _side = 20;
                        });
                      })),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: ElevatedButton(
                      child: Text('Grow'),
                      onPressed: () {
                        setState(() {
                          _side = 300;
                        });
                      })),
            ],
          ),
        )
      ],
    );
  }
}
