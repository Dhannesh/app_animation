import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    super.key,
    required AnimationController controller,
  }) : animation = ProfilePageEnterAnimation(controller);

  final ProfilePageEnterAnimation animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: AnimatedBuilder(
            animation: animation.controller,
            builder: (BuildContext _, child) {
              return Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        topBar(animation.barHeight.value),
                        circle(
                          size,
                          animation.avatarSize.value,
                        )
                      ],
                    ),
                  )
                ],
              );
            }));
  }
}

Container topBar(double height) {
  return Container(
    height: height,
    width: double.infinity,
    color: Colors.purple[100],
  );
}

Positioned circle(Size size, double animationValue) {
  return Positioned(
    top: 100,
    left: size.width / 2 - 50,
    child: Transform(
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(animationValue, animationValue, 1.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
              image: AssetImage("images/dog.jpg"), fit: BoxFit.cover),
        ),
      ),
    ),
  );
}

class ProfilePageEnterAnimation {
  final AnimationController controller;
  final Animation<double> barHeight;
  final Animation<double> avatarSize;
  ProfilePageEnterAnimation(this.controller)
      : barHeight = Tween<double>(begin: 0, end: 150).animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.7,curve: Curves.easeIn))),
        avatarSize = Tween<double>(begin: 0, end: 2.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 1.0,curve: Curves.elasticOut)));
}
