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
  Color _color = Color.fromARGB(
      Random.secure().nextInt(255),
      Random.secure().nextInt(255),
      Random.secure().nextInt(255),
      Random.secure().nextInt(255));
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Center(
          child: Container(
            width: _side,
            height: _side,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: _color),
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
                        timer?.cancel();
                        timer = Timer.periodic(Duration(milliseconds: 100),
                            (timer) {
                          setState(() {
                            if (_side > 1) {
                              _side -= 2;
                              if (_side % 10 == 0) {
                                _color = Color.fromARGB(
                                    Random.secure().nextInt(255),
                                    Random.secure().nextInt(255),
                                    Random.secure().nextInt(255),
                                    Random.secure().nextInt(255));
                              }
                            }
                          });
                        });
                      })),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: ElevatedButton(
                      child: Text('Stop'),
                      onPressed: () {
                        setState(() {
                          timer?.cancel();
                        });
                      })),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: ElevatedButton(
                      child: Text('Grow'),
                      onPressed: () {
                        timer?.cancel();
                        timer = Timer.periodic(Duration(milliseconds: 100),
                            (timer) {
                          setState(() {
                            if (_side < 300) {
                              _side += 2;
                              if (_side % 10 == 0) {
                                _color = Color.fromARGB(
                                    Random.secure().nextInt(255),
                                    Random.secure().nextInt(255),
                                    Random.secure().nextInt(255),
                                    Random.secure().nextInt(255));
                              }
                            }
                          });
                        });
                      })),
            ],
          ),
        )
      ],
    );
  }
}
