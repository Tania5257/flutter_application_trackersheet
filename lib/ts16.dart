//16. Design a simple app where a container changes its size, color, and shape when a button is clicked, using animation.

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(AnimatedBoxApp());

class AnimatedBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: AnimatedContainerScreen(),
    );
  }
}

class AnimatedContainerScreen extends StatefulWidget {
  @override
  _AnimatedContainerScreenState createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.teal;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _changeContainer() {
    final random = Random();
    setState(() {
      _width = 100 + random.nextInt(200).toDouble(); 
      _height = 100 + random.nextInt(200).toDouble();  
      _color = Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Container"), centerTitle: true, ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              alignment: Alignment.center,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Hello!',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'SpicyRice'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _changeContainer,
              child: Text('Press here!'),
            ),
          ],
        ),
      ),
    );
  }
}
