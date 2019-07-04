import 'package:drunk_guide/auth_service.dart';
import 'package:drunk_guide/globals.dart';
import 'package:drunk_guide/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class FriendsScreen extends StatelessWidget {
  Widget getUserWidget(List<User> users) {
    if (users.length > 0) {
      return ListView(
          children: users
              .where((user) => (user != null))
              .map(
                  (user) => Card(
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
                    ),
              )
              .toList());
    }
    return Center(
        child: Text(
      "No friends :(",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
      ),
      body: StreamBuilder(
        stream: services.get<AuthService>().friends
          .switchMap((list) => Observable.fromFuture(list))
          .map((list) => getUserWidget(list)),
        builder: (context, snapshot) {
          return Center(child: snapshot.data ?? CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {/*TODO: Add functionality*/},
        child: Icon(Icons.add),
      ),
    );
  }
}
