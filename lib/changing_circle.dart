import 'package:flutter/material.dart';

class ChangingCircle extends StatefulWidget {
  const ChangingCircle({super.key});

  @override
  State<ChangingCircle> createState() => _ChangingCircleState();
}

class _ChangingCircleState extends State<ChangingCircle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 2500), vsync: this
    );
    _animationController.addListener((){
      setState(() {
        debugPrint('Value: ${_animationController.value}');
      });
    });
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("Animation Controller"),
    ),
      body: Column(
        children: [
          Expanded(child: Center(
            child: Container(
              height: _animationController.value * 300,
              width: _animationController.value * 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                shape: BoxShape.circle
              ),
            ),
          )),
          Padding(padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Expanded(child: ElevatedButton(onPressed: (){
                _animationController.forward();
              }, child: Text('Animate'))),
              Expanded(child: ElevatedButton(onPressed: (){
                _animationController.forward();
              }, child: Text('Forward'))),
              Expanded(child: ElevatedButton(onPressed: (){
                _animationController.reverse();
              }, child: Text('Reverse'))),
              Expanded(child: ElevatedButton(onPressed: (){
                _animationController.stop();
              }, child: Text('Stop'))),
              Expanded(child: ElevatedButton(onPressed: (){
                _animationController.reset();
              }, child: Text('Reset')))
            ],
          ),)
        ],
      ),
    );
  }
}
