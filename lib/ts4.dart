//4. Design an app where you use various text styles, such as changing font sizes, weights, and color. Show how to style Text widgets within a Column or Row.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Styling Example', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), // regular er jnno textstyle.regular .....Bold title text
          backgroundColor: Colors.deepPurpleAccent, //appbar color
        ),
        body: TextStylesDemo(), // Calls the widget displaying text styles
      ),
    );
  }
}

class TextStylesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20), // Adds padding around the content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Aligns text to the left....start =left, end=right, center=center of the screen
        children: [
          Text(
            'Bold Text',
            style: TextStyle(color: Colors.amber ,fontSize: 25, fontWeight: FontWeight.bold), // bold text with larger size
          ),
          SizedBox(height: 15), // Adds spacing
          Text(
            'Italic Text',
            style: TextStyle(color: Colors.orange ,fontSize: 25, fontStyle: FontStyle.italic), //  italic text
          ),
          SizedBox(height: 15), // Adds spacing
          Text(
            'Colored Text',
            style: TextStyle(fontSize: 25, color: Colors.deepPurple), //  colored text 
          ),
          SizedBox(height: 15),
          Text(
            'Colored Text small',
            style: TextStyle(fontSize: 15, color: Colors.blue), //  colored text (blue)
          ),
          SizedBox(height: 15),
          Text(
            'Colored Text big',
            style: TextStyle(fontSize: 35, color: Colors.blue), //  colored text (blue)
          ),
          SizedBox(height: 15), // Adds spacing
          Text(
            'Underlined Text',
            style: TextStyle(color: Colors.black ,fontSize: 25, decoration: TextDecoration.underline), // Implements underlined text
          ),
          SizedBox(height: 15), // Adds spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes text elements evenly in the row
            children: [
              Text(
                'Row Text 1',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.pink), // Row text with medium weight and red color
              ),
              Text(
                'Row Text 2',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.green), // Row text with medium weight and green color
              ),
            ],
          ),
        ],
      ),
    );
  }
}
