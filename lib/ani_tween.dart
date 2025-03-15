import 'package:flutter/material.dart';

class AniTween extends StatefulWidget {
  const AniTween({super.key});

  @override
  State<AniTween> createState() => _AniTweenState();
}

class _AniTweenState extends State<AniTween>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    _animation = Tween<double>(begin: 50, end: 300).animate(_animationController);
    _colorAnimation = ColorTween(
      begin: Colors.lightGreenAccent,
      end: Colors.cyan
    ).animate(_animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          title: const Text("Tween"),
        ),
        body:Column(
          children: [
            Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext _, child) {
                      return Container(
                       width: _animation.value,
                        height: _animation.value,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _colorAnimation.value,
                          shape: BoxShape.circle,
                        ),
                      );
                    },
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
                            _animationController.reset();
                          },
                          child: Text('Reset'))),
                ],
              ),
            )
          ],
        ),

    );
  }
}
