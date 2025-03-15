import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // var arguments = ModalRoute.of(context)!.settings.arguments as Map;
   // var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Hero(tag: arguments['toy'].title, child: Image.asset("${arguments['toy'].imageName}")),
          Hero(
            tag: "Text-${arguments['toy'].title}",
            child: Text(
              "${arguments['toy'].title}",
              style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
          )
        ],
      ),
    );
  }
}
