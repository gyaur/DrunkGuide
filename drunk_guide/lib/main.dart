import 'package:drunk_guide/main_screen.dart';
import 'package:flutter/material.dart';

import './login_screen.dart';

void main() => runApp(DrunkGuide());

class DrunkGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginScreen(),
        '/MainScreen': (context) => MainScreen()
      },
    );
  }
}
