import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  const BasicAnimation({super.key});

  @override
  State<BasicAnimation> createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation> {
  double _width = 50;
  double _height = 50;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Center(
          child: Container(
            width: _width,
            height: _height,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.lightGreenAccent),
          ),
        )),
        Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _width -= 4;
                          _height -= 4;
                        });
                      },
                      child: Text('Shrink'))),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _width += 4;
                          _height += 4;
                        });
                      },
                      child: Text('Grow')))
            ],
          ),
        )
      ],
    );
  }
}
