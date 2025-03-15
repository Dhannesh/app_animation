import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insta Store'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'toy',
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("images/ducky.png"),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange,foregroundColor: Colors.white),
                onPressed: (){
              Navigator.pushNamed(context, '/product_details');
            }, child: Text("View"))
          ]
        ),
      ),
    );
  }
}
