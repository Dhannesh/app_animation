import 'package:flutter/material.dart';

class AnimatedSlidePage extends StatefulWidget {
  const AnimatedSlidePage({super.key});

  @override
  State<AnimatedSlidePage> createState() => _AnimatedSlidePageState();
}

class _AnimatedSlidePageState extends State<AnimatedSlidePage> {
  Offset offset = Offset.zero;
  void _slideLeft() {
    setState(() {
      offset -= Offset(1, 0);
    });
  }

  void _slideRight() {
    setState(() {
      offset += Offset(1, 0);
    });
  }
  void _slideUp() {
    setState(() {
      offset -= Offset(0, 1);
    });
  }
  void _slideDown() {
    setState(() {
      offset += Offset(0, 1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("Animated Slide"),
    ),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          Text("Click to move the tie"),
          Padding(
              padding: EdgeInsets.all(50),
            child: AnimatedSlide(offset: offset, duration: Duration(milliseconds: 1000), curve: Curves.bounceIn,
              child: Image(image: AssetImage("images/tie.jpg"), width: 200, height: 200, fit: BoxFit.cover,),
            ),
          ),
          ElevatedButton(onPressed: _slideUp, child: Icon(Icons.arrow_upward_rounded)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              ElevatedButton(onPressed: _slideLeft, child: Icon(Icons.chevron_left)),
              ElevatedButton(onPressed: _slideRight, child: Icon(Icons.chevron_right))
            ],
          ),
          ElevatedButton(onPressed: _slideDown, child: Icon(Icons.arrow_downward_outlined)),
        ],

      ),
    )
    );
  }
}
