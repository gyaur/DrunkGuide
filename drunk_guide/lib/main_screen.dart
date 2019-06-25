import 'package:drunk_guide/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    Text("0",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 120, color: Colors.red)),
    HomeScreen(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Text"),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.people),
          ),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/SettingsScreen');
              }),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Container(child: pages[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          bottomNavigationBarItemBuilder(Icons.settings, "NotSettings"),
          bottomNavigationBarItemBuilder(Icons.home, "Home"),
          bottomNavigationBarItemBuilder(Icons.people, "NotFriends"),
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
    );
  }
}
