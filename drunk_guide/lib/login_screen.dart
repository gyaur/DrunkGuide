import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            body: Container(
                child: Column(
      children: <Widget>[
        Container(
          child: Image.asset("assets/temp_logo.png"),
          padding: EdgeInsets.all(100),
        ),
        Container(
            child: MaterialButton(
          onPressed: () {},
          child: Text("Login with Google"),
          color: Colors.blue,
        ))
      ],
    ))));
  }
}
