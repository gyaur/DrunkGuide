import 'package:drunk_guide/settings_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  final settingsService = services.get<SettingsService>();

  Widget _settingsItemBuilder(
      String settingTitle, String settingDescription, String switcher) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[Text(settingTitle), Text(settingDescription)],
          ),
          Switch(
            value: settingsService.getSetting(switcher),
            onChanged: (toggle) {
              setState(() {
                settingsService.changeSetting(switcher, toggle);
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _settingsItemBuilder(
              "settingTitle",
              "settingDescription",
              "setting1",
            ),
            _settingsItemBuilder(
              "settingTitle",
              "settingDescription",
              "setting2",
            ),
            _settingsItemBuilder(
              "settingTitle",
              "settingDescription",
              "setting3",
            ),
          ],
        ),
      ),
    );
  }
}
