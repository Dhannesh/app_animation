import 'package:flutter/material.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> with SingleTickerProviderStateMixin {
  static const double walletBalance = 1000;
  late final AnimationController controller;
  late final Animation<double> animation;
  late Animation<Color?> color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2)
    )..addListener(() {
      setState(() {

      });
    });
    animation = Tween<double>(begin: 0, end: walletBalance).animate(controller);
    color = ColorTween(begin: Colors.grey, end: Colors.greenAccent).animate(controller);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("My Wallet"),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.wallet, size: 200,color: color.value),
            ConstrainedBox(constraints: BoxConstraints(maxWidth: 200), child: Text(
              '\$${animation.value.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 32),
            ),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(controller.status==AnimationStatus.completed ?'Spend':'Top Up', style: const TextStyle(fontSize: 24),),
                ),
                onPressed: (){
                if(controller.status == AnimationStatus.completed){
                controller.reverse();
              }else {
                  controller.forward();
                }
            }, )
          ]
        ),
      ),
    );
  }
}
