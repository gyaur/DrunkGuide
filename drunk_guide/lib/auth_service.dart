import 'package:drunk_guide/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Observable<FirebaseUser> user;
  Observable<User> profile;
  Observable<Future<List<User>>> friends;

  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db
            .collection('users')
            .document(u.uid)
            .snapshots()
            .map((snap) => User.fromFirestore(snap));
      } else {
        return Observable.just(User());
      }
    });
    friends = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db.collection('users').document(u.uid).snapshots().map(
            (snap) async => await Future.wait(List.from(
                List<String>.from(snap.data['friends'].cast<String>())
                    .map((String uid) => (getUserfromUid(uid))))));
      } else {
        return Observable.just(Future.wait([]));
      }
    });
  }

  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    updateUserData(user);

    print("signed in " + user.displayName);
    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);
    List<String> friends = [];
    await Firestore.instance
        .collection('users')
        .document(user.uid)
        .get()
        .then((DocumentSnapshot ds) {
      if (ds.data != null) {
        friends = ds.data['friends']?.cast<String>() ?? [];
      }
      //friends = List<String>.from(friends);
    });

    return ref.setData(
      {
        'uid': user.uid,
        'email': user.email,
        'photoURL': user.photoUrl,
        'displayName': user.displayName,
        'lastSeen': DateTime.now(),
        'friends': friends
      },
      merge: true,
    );
  }

  Future<User> getUserfromUid(String uid) async {
    var user;
    await Firestore.instance
        .collection('users')
        .document(uid)
        .get()
        .then((DocumentSnapshot ds) {
      //TODO: Check for case when no user exists with this uid
      user = User.fromFirestore(ds);
      //friends = List<String>.from(friends);
    });

    return user;
  }
}

final AuthService authService = AuthService();
