//13.Create an app with a customized AppBar. Add a logo, title, and actions like a search button or menu icon.



import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom AppBar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/diu_logo.png', 
            height: 30,
          ),
        ),
        title: const Text('Daffodil International University', style: TextStyle(fontFamily: 'SpicyRice'),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Search button pressed');
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                const PopupMenuItem<String>(
                  value: 'profile',
                  child: Text('Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
        
        backgroundColor: Colors.green, 
        foregroundColor: Colors.white, 
        elevation: 4, 
        shape: const RoundedRectangleBorder( 
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true, 
      ),
      body: const Center(
        child: Text(
          'Hello everyone!',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: 'SpicyRice',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}