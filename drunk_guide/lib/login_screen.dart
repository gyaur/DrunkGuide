import 'package:drunk_guide/globals.dart';
import 'package:drunk_guide/settings_service.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class LoginScreen extends StatelessWidget {
  final sharedPrefs = services.get<SettingsService>().prefs;
  LoginScreen();
  Future loginWithGoogle(context) async {
    await services.get<AuthService>().handleSignIn();
    sharedPrefs.setBool("logged_in", true);
    //TODO: Use FirebaseAuth to check sign in status
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
                color: Theme.of(context).buttonColor,
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
              padding: EdgeInsets.only(top: 10),
            )
          ],
        ),
      ),
    );
  }
}
