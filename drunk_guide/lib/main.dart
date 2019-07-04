import 'package:drunk_guide/auth_service.dart';
import 'package:drunk_guide/friends_screen.dart';
import 'package:drunk_guide/globals.dart';
import 'package:drunk_guide/login_screen.dart';
import 'package:drunk_guide/main_screen.dart';
import 'package:drunk_guide/settings_screen.dart';
import 'package:drunk_guide/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  services.registerSingleton<SettingsService>(SettingsService());
  services.registerSingleton<AuthService>(AuthService());
  runApp(DrunkGuide());
}

class DrunkGuide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrunkGuideState();
  }
}

class _DrunkGuideState extends State<DrunkGuide> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Landing(),
      routes: <String, WidgetBuilder>{
        '/MainScreen': (context) => MainScreen(),
        '/LoginScreen': (context) => LoginScreen(),
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

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LandingState();
  }
}

class _LandingState extends State<Landing> {
  SharedPreferences prefs;

  Future<bool> isLoggedIn() async {
    return (await SharedPreferences.getInstance()).getBool("logged_in") ??
        false;
    //TODO: Make const variables for keys
  }

  @override
  void initState() {
    super.initState();

    isLoggedIn().then((loggedIn) {
      Navigator.pushReplacementNamed(
          context, loggedIn ? '/MainScreen' : '/LoginScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
