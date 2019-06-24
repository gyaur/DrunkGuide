import 'package:drunk_guide/settings_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    SettingsScreen(),
    Text("1",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 120, color: Colors.red)),
    Text("2",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 120, color: Colors.red))
  ];
  int selectedIndex = 1;

  BottomNavigationBarItem bottomNavigationBarItemBuilder(
          IconData icon, String title) =>
      BottomNavigationBarItem(icon: Icon(icon), title: Text(title));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/temp_background.jpg"),
            colorFilter: ColorFilter.mode(
                Colors.transparent.withOpacity(0.7), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(child: pages[selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            bottomNavigationBarItemBuilder(Icons.settings, "Settings"),
            bottomNavigationBarItemBuilder(Icons.home, "Home"),
            bottomNavigationBarItemBuilder(Icons.people, "Friends"),
          ],
          selectedItemColor: Colors.amber,
          backgroundColor: Colors.grey.withAlpha(120),
          currentIndex: selectedIndex,
          onTap: (ind) {
            setState(() {
              selectedIndex = ind;
            });
          },
        ),
      ),
    );
  }
}
