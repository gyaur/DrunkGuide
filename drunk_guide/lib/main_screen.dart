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

  BottomNavigationBarItem _bottomNavigationBarItemBuilder(
          IconData icon, String title) =>
      BottomNavigationBarItem(icon: Icon(icon), title: Text(title));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: getUser().then((user) {
            return user.displayName.contains("Morva")
                ? "${user.displayName} is the Big Gay!"
                : user.displayName;
          }),
          builder: (context, snapshot) {
            return Text(snapshot.data ?? "Something fucky");
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              Navigator.pushNamed(context, '/FriendsScreen');
            },
          ),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/SettingsScreen');
              }),
        ],
      ),
      body: Container(child: pages[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _bottomNavigationBarItemBuilder(Icons.settings, "NotSettings"),
          _bottomNavigationBarItemBuilder(Icons.home, "Home"),
          _bottomNavigationBarItemBuilder(Icons.people, "NotFriends"),
        ],
        backgroundColor: Colors.white10,
        elevation: 0,
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
