import 'package:flutter/material.dart';

class Product {
  final String imageName;
  final String title;
  Product({required this.imageName, required this.title});
}

List<Product> _toys = [
  Product(imageName: "images/ball.png", title: "Ball"),
  Product(imageName: "images/car.png", title: "Car"),
  Product(imageName: "images/dino.png", title: "Dinosaur"),
  Product(imageName: "images/ducky.png", title: "Duck"),
  Product(imageName: "images/teddy.png", title: "Teddy Bear"),
  Product(imageName: "images/horse.png", title: "Rocking Horse"),
  Product(imageName: "images/doll.png", title: "Doll"),
  Product(imageName: "images/robot.png", title: "Robot"),

];


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
      body: GridView.custom(
        padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          childrenDelegate: SliverChildBuilderDelegate((context, int index){
            return Stack(children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Hero(
                  tag: _toys[index].title,
                    child: Image.asset(_toys[index].imageName, height: double.infinity, width: double.infinity, fit: BoxFit.cover)),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/product_details",arguments: {'toy':_toys[index]});
                },
            style: ElevatedButton.styleFrom(fixedSize: Size(200, 40), shape: StadiumBorder(), backgroundColor: Colors.deepOrange,foregroundColor: Colors.white),
            child: Text(_toys[index].title),
              )
              )
            ]
            );
          },
          childCount: _toys.length
          )
      )
    );
  }
}
