import 'package:drunk_guide/auth_service.dart';
import 'package:drunk_guide/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FriendsScreen extends StatelessWidget {
  Widget getUserWidget(List<User> users) {
    if (users.length > 0) {
      return ListView(
          children: users
              .where((user) => (user != null))
              .map(
                (user) => (Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoURL),
                              minRadius: 20,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(user.displayName),
                                Text(user.email)
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              )
              .toList());
    }
    return Center(
        child: Text(
      "No friends :(",
      style: TextStyle(color: Colors.white),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.transparent,
      body: StreamBuilder(
        stream: authService.friends,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: snapshot.data,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Center(child: getUserWidget(snapshot.data));
                return Center(child: CircularProgressIndicator());
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {/*TODO: Add functionality*/},
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
