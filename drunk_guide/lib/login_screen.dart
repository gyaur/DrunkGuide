import 'package:flutter/material.dart';

import 'auth_service.dart';

class LoginScreen extends StatelessWidget {
  final sharedPrefs;
  LoginScreen(this.sharedPrefs);
  Future loginWithGoogle(context) async {
    await authService.handleSignIn();
    sharedPrefs.setBool(
        "logged_in", true); //TODO: Use FirebaseAuth to check sign in status
    Navigator.pushReplacementNamed(context, "/MainScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset("assets/temp_logo.png"),
              padding: EdgeInsets.all(100),
            ),
            Container(
              child: MaterialButton(
                onPressed: () {
                  loginWithGoogle(context);
                },
                child: Text(
                  "Login with Google",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                minWidth: 300,
                height: 50,
              ),
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            )
          ],
        ),
      ),
    );
  }
}
