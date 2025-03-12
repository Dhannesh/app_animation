import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  const BasicAnimation({super.key});

  @override
  State<BasicAnimation> createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation> {
  double _sliderValue = 50.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Center(
          child: Container(
            width: _sliderValue,
            height: _sliderValue,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.lightGreenAccent),
          ),
        )),
        Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Slider(
                      value: _sliderValue,
                      min: 20,
                      max: 300,
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      }))
            ],
          ),
        )
      ],
    );
  }
}
