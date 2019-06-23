import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset("assets/temp_logo.png"),
                padding: EdgeInsets.all(100),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Login with Google"),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                minWidth: 300,
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
