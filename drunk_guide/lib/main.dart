import 'package:drunk_guide/main_screen.dart';
import 'package:drunk_guide/settings_screen.dart';
import 'package:flutter/material.dart';

import './login_screen.dart';

void main() => runApp(DrunkGuide());

class DrunkGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) =>
            (false) //TODO: Replace with SharedPrefernces info to check if the user is logged in
                ? LoginScreen()
                : MainScreen(),
        '/MainScreen': (context) => MainScreen(),
        '/SettingsScreen': (context) => SettingsScreen(),
      },
    );
  }
}
