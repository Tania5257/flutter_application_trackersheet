//Design a container with a colored background, rounded corners, and a shadow. Inside the container, display a Text widget.


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Container',
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        appBar: AppBar(title: Text(' Container Example')),
        backgroundColor: Colors.lightBlueAccent[50],
        body: Center(
          child: StylishContainer(),
        ),
      ),
    );
  }
}

class StylishContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,height: 150,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 58, 130, 189), 
        borderRadius: BorderRadius.circular(20), 
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(66, 35, 0, 0),  
            blurRadius: 25,
            offset: Offset(4, 4), 
          ),
        ],
      ),
      child: Text(
        'Hello! This is Tania here :) .',
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontFamily: 'SpicyRice',
        ),
      ),
    );
  }
}
