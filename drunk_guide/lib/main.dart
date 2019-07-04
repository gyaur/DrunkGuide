import 'package:drunk_guide/friends_screen.dart';
import 'package:drunk_guide/login_screen.dart';
import 'package:drunk_guide/main_screen.dart';
import 'package:drunk_guide/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data ? MainScreen() : LoginScreen(prefs);
            }
            return Center(child: CircularProgressIndicator());
          }),
      routes: <String, WidgetBuilder>{
        '/MainScreen': (context) => MainScreen(),
        '/SettingsScreen': (context) => SettingsScreen(),
        '/FriendsScreen': (context) => FriendsScreen(),
      },
      theme: ThemeData(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        accentColor: Colors.amberAccent,
      ),
    );
  }
}
