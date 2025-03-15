import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Hero(tag: 'toy', child: Image.asset("images/ducky.png")),
          const Text(
            "Duck",
            style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange),
          )
        ],
      ),
    );
  }
}
