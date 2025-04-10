//8.Design an app with a navigation drawer. The drawer should have multiple options, 
//and each option should navigate to a different screen using a Navigator.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Drawer Example")),
      backgroundColor: const Color.fromARGB(255, 158, 191, 218),
      drawer: AppDrawer(),
      body: Center(child: Text("Home Screen", style: TextStyle(fontSize: 22))),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle, size: 70, color: Colors.white),
                SizedBox(height: 10),
                Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18)),
                Text("user@mail.example.com", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          DrawerItem(title: "Home", icon: Icons.home, onTap: () => _navigateTo(context, HomeScreen())),
          DrawerItem(title: "Profile", icon: Icons.person, onTap: () => _navigateTo(context, ProfileScreen())),
          DrawerItem(title: "Settings", icon: Icons.settings, onTap: () => _navigateTo(context, SettingsScreen())),
          DrawerItem(title: "Logout", icon: Icons.exit_to_app, onTap: () => _showLogoutDialog(context)),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Logout"),
        content: Text("Confirm logout?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          TextButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), child: Text("Logout")),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DrawerItem({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("Profile Screen", style: TextStyle(fontSize: 22))),
    );
  }
}

// Settings Screen
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("Settings Screen", style: TextStyle(fontSize: 22))),
    );
  }
}
