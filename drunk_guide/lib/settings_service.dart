import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const List<String> settingsKeys = ["setting1", "setting2", "setting3"];
  Map<String, bool> settingsItems;

  SharedPreferences prefs;

  SettingsService() {
    SharedPreferences.getInstance().then((pref) {
      prefs = pref;
      List<String> temp = prefs.getStringList("settings") ??
          List.filled(settingsKeys.length, "false");
      if (temp.length > 0) {
        settingsItems = Map.fromIterables(
            settingsKeys, temp.map((String key) => stringtoBool(key)));
      }
    });
  }
  bool stringtoBool(String inp) {
    switch (inp) {
      case "true":
        return true;
      case "false":
        return false;
      default:
        return false;
    }
  }

  void changeSetting(String key, bool value) {
    if (settingsItems.containsKey(key)) {
      settingsItems[key] = value;
      prefs.setStringList(
          "settings",
          List.from(
              settingsItems.values.map((setting) => (setting.toString()))));
    }
  }

  bool getSetting(String key) {
    return settingsItems[key] ?? false;
  }
}
