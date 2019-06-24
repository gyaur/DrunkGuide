import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

Widget settingsItemBuilder(
    String settingTitle, String settingDescription, Switch switcher) {
  return Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[Text(settingTitle), Text(settingDescription)],
        ),
        switcher,
      ],
    ),
  );
}

class _SettingsScreenState extends State<SettingsScreen> {
  //TODO: Add SharedPrefrences to save the settings
  List<bool> settings = [false, true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Column(
          children: <Widget>[
            settingsItemBuilder(
                "settingTitle",
                "settingDescription",
                Switch(
                  value: settings[0],
                  onChanged: (tog) {
                    setState(() {
                      settings[0] = tog;
                    });
                  },
                )),
            settingsItemBuilder(
                "settingTitle",
                "settingDescription",
                Switch(
                  value: settings[1],
                  onChanged: (tog) {
                    setState(() {
                      settings[1] = tog;
                    });
                  },
                )),
            settingsItemBuilder(
                "settingTitle",
                "settingDescription",
                Switch(
                  value: settings[2],
                  onChanged: (tog) {
                    setState(() {
                      settings[2] = tog;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
