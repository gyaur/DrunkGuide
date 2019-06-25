import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  void loginWithGoogle() {}
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
                  loginWithGoogle();
                },
                child: Text(
                  "Login with Google",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                color: Colors.blue,
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
