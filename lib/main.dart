//Create a basic Flutter application that displays "Hello World!" in the center of the screen with a custom font and color.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Hide the debug banner
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],  // Custom background color
        body: Center(
          child: Text(
            "Hello World!",
            style: TextStyle(
              fontSize: 50,
              fontFamily: 'SpicyRice',  // Custom font
              color: Colors.deepPurple,  // Custom text color
            ),
          ),
        ),
      ),
    );
  }
}
