import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

enum LoginStatus {
  user,
  loggedOut,
  initial,
}

class DrootFirebaseUser {
  DrootFirebaseUser({this.firebaseUser, this.loginStatus});
  final User firebaseUser;
  final LoginStatus loginStatus;

  static DrootFirebaseUser user(User user) =>
      DrootFirebaseUser(firebaseUser: user, loginStatus: LoginStatus.user);

  static DrootFirebaseUser loggedOut() =>
      DrootFirebaseUser(loginStatus: LoginStatus.loggedOut);

  static DrootFirebaseUser initial() =>
      DrootFirebaseUser(loginStatus: LoginStatus.initial);

  T when<T>(
      {T Function(User) user, T Function() loggedOut, T Function() initial}) {
    switch (loginStatus) {
      case LoginStatus.user:
        return user(firebaseUser);
      case LoginStatus.loggedOut:
        return loggedOut();
      default:
        return initial();
    }
  }

  T maybeWhen<T>(
      {T Function(User) user,
      T Function() loggedOut,
      T Function() initial,
      T Function() orElse}) {
    switch (loginStatus) {
      case LoginStatus.user:
        return user != null ? user(firebaseUser) : orElse();
      case LoginStatus.loggedOut:
        return loggedOut != null ? loggedOut() : orElse();
      case LoginStatus.initial:
        return initial != null ? initial() : orElse();
      default:
        return orElse();
    }
  }
}

bool loggedIn = false;

final drootFirebaseUser = FirebaseAuth.instance
    .userChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DrootFirebaseUser>((user) {
  loggedIn = user != null;
  return user != null
      ? DrootFirebaseUser.user(user)
      : DrootFirebaseUser.loggedOut();
}).shareValueSeeded(DrootFirebaseUser.initial());

DrootFirebaseUser get currentUser => drootFirebaseUser.value;
