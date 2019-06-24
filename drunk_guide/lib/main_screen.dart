import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/temp_background.jpg"),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop)),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text("Settings")),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text("Friends")),
          ],
          selectedItemColor: Colors.amber,
          backgroundColor: Colors.grey,
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
