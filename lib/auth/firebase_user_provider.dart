import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DrootFirebaseUser {
  DrootFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

DrootFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DrootFirebaseUser> drootFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DrootFirebaseUser>((user) => currentUser = DrootFirebaseUser(user));
