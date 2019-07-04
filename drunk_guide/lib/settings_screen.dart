import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings_service.dart';

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
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            settingsItemBuilder(
                "settingTitle",
                "settingDescription",
                Switch(
                  value: settingsService.getSetting("setting1"),
                  onChanged: (toggle) {
                    setState(() {
                      settingsService.changeSetting("setting1", toggle);
                    });
                  },
                )),
            settingsItemBuilder(
                "settingTitle",
                "settingDescription",
                Switch(
                  value: settingsService.getSetting("setting2"),
                  onChanged: (toggle) {
                    setState(() {
                      settingsService.changeSetting("setting2", toggle);
                    });
                  },
                )),
            settingsItemBuilder(
              "settingTitle",
              "settingDescription",
              Switch(
                value: settingsService.getSetting("setting3"),
                onChanged: (toggle) {
                  setState(() {
                    settingsService.changeSetting("setting3", toggle);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
