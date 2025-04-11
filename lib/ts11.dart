//Build an app that displays an image from the local assets. 
//Set up your pubspec.yaml file properly to include the asset.


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Image Example',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ImageScreen(),
    );
  }
}

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOON', style: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 46, 16, 129))),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 12, 55, 86), 
          child: Image.asset(
            'assets/images/moon.jpg',
            width: 500,
            height: 500,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
