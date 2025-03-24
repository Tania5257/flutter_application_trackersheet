//3. Create an app that displays a list of items using a ListView. Each item should be a text widget with a unique number.


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Example Tracker Sheet 3'),
          backgroundColor: Colors.blue, 
        ),
        body: ItemList(),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<String> items = [
    'Mobile Application Design', 'Computer Architecture & Organization', 'Compiler Design', 'Artificial Intelligence',
    'Mobile Application Design Lab', 'Compiler Design Lab', 'Artificial Intelligence Lab'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(), // Adds line separator
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${index + 1}. ${items[index]}'),
        );
      },
    );
  }
}
