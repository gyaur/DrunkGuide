import 'package:drunk_guide/friends_screen.dart';
import 'package:drunk_guide/main_screen.dart';
import 'package:drunk_guide/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './login_screen.dart';

void main() => runApp(DrunkGuide());

class DrunkGuide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrunkGuideState();
  }
}

class _DrunkGuideState extends State<DrunkGuide> {
  SharedPreferences prefs;
  Future<bool> isLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool("logged_in") ?? false;
    //TODO:Make const variables for keys
  }

//TODO: Add theme
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data) {
              return MainScreen();
            }
            return LoginScreen(prefs);
          }),
      routes: <String, WidgetBuilder>{
        '/MainScreen': (context) => MainScreen(),
        '/SettingsScreen': (context) => SettingsScreen(),
        '/FriendsScreen': (context) => FriendsScreen(),
      },
    );
  }
}
