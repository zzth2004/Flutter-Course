

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class magic8ballscreen extends StatefulWidget{

  const magic8ballscreen({Key? key}) : super(key : key);

  State<magic8ballscreen> createState() => _magic8ballScreenState();

}

class _magic8ballScreenState extends State<magic8ballscreen>{
  final List<String> images = [
    "assets/images/ball1.png",
    "assets/images/ball2.png",
    "assets/images/ball3.png",
    "assets/images/ball4.png",
    "assets/images/ball5.png",
  ];
  String currentImage = "assets/images/ball1.png";

  void changeImage() {
    final random = Random();
    setState(() {
      currentImage = images[random.nextInt(images.length)];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Ask me anything",  style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.w500),  ),
        backgroundColor: Colors.blueAccent
      ),
      body: Center(
        child: Container(
          child: InkWell(
            onTap: changeImage,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Image.asset(currentImage, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height),
          ),
        )
      ),
    );
    throw UnimplementedError();
  }
  
}