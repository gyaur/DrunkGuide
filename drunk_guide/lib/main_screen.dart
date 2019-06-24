import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
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
                Colors.transparent.withOpacity(0.5), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            child: Center(
          child: Text(
            selectedIndex.toString(),
            style: TextStyle(
                color: Colors.red, fontSize: 100, fontWeight: FontWeight.bold),
          ),
        )),
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
