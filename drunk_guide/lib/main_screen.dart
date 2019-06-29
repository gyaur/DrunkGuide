import 'package:drunk_guide/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  Future<FirebaseUser> getUser() async {
    return await FirebaseAuth.instance.currentUser().then((data) {
      return data;
    });
  }

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
        title: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.displayName.contains("Morva")) {
                return Text(snapshot.data.displayName + " is the Big Gay!");
              }
              return Text(snapshot.data.displayName);
            }
            return Text("Something fucky");
          },
        ),
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
