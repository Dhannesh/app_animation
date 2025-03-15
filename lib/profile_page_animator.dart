import 'package:app_animation/profile_page.dart';
import 'package:flutter/material.dart';

class ProfilePageAnimator extends StatefulWidget {
  const ProfilePageAnimator({super.key});

  @override
  State<ProfilePageAnimator> createState() => _ProfilePageAnimatorState();
}

class _ProfilePageAnimatorState extends State<ProfilePageAnimator> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text("My Profile"),
    ),
      body: ProfilePage(
        controller: _controller
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _controller.reset();
        _controller.forward();
      },
      child: Icon(Icons.play_arrow),),
    );
  }
}
