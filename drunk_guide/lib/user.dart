import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String email;
  final String photoURL;
  final String displayName;
  final Timestamp lastSeen;
  final List<dynamic> friends;

  User(
      {this.uid,
      this.email,
      this.photoURL,
      this.displayName,
      this.lastSeen,
      this.friends});

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return User(
      uid: doc.documentID,
      email: data['email'],
      photoURL: data['photoURL'],
      displayName: data['displayName'],
      lastSeen: data['lastSeen'],
      friends: data['friends'],
    );
  }
}
