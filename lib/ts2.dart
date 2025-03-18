//2. Create a Flutter app with a button that, when pressed, changes the text on the screen to "Button Pressed". Use a StatefulWidget for this.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ButtonTextChanger(),
    );
  }
}

class ButtonTextChanger extends StatefulWidget {
  @override
  _ButtonTextChangerState createState() => _ButtonTextChangerState();
}

class _ButtonTextChangerState extends State<ButtonTextChanger> {
  String displayText = "Press the Button";

  void changeText() {
    setState(() {
      displayText = "Button Pressed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Button Example, Trackersheet 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayText,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeText,
              child: Text("Press Here"),
            ),
          ],
        ),
      ),
    );
  }
}
