import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  const AnimatedCrossFadePage({super.key});

  @override
  State<AnimatedCrossFadePage> createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _showFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("Animated Cross Fade"),
    ),
    body: Center(
      child: AnimatedCrossFade(firstChild: InkWell(
        onTap:(){
          setState(() {
            _showFirst = !_showFirst;
          });
        },
        child: Card(
          elevation: 7,
          child: Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(3.0))
            ),
            child: Image(image: AssetImage("images/top.jpg"),
                fit: BoxFit.cover),
          ),
        ),
      ), secondChild: InkWell(
        onTap:(){
          setState(() {
            _showFirst = !_showFirst;
          });
        },
        child: Card(
          elevation: 7,
          child: Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(3.0))
            ),
            child: Image(image: AssetImage("images/jeans.jpg"),
                fit: BoxFit.cover),
          ),
        ),
      ), crossFadeState: _showFirst? CrossFadeState.showFirst: CrossFadeState.showSecond,
          duration: Duration(seconds: 2)),
    )
    );
  }
}
