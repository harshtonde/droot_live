import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_user_provider.dart';

export 'anonymous_auth.dart';
export 'apple_auth.dart';
export 'email_auth.dart';
export 'google_auth.dart';

/// Tries to sign in or create an account using Firebase Auth.
/// Returns the User object if sign in was successful.
Future<User> signInOrCreateAccount(
    BuildContext context, Future<UserCredential> Function() signInFunc) async {
  try {
    final userCredential = await signInFunc();
    await maybeCreateUser(userCredential.user);
    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message}')),
    );
    return null;
  }
}

Future signOut() => FirebaseAuth.instance.signOut();

Future resetPassword({String email, BuildContext context}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message}')),
    );
    return null;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Password reset email sent!')),
  );
}

String get currentUserEmail =>
    currentUser.maybeWhen(user: (user) => user.email, orElse: () => '');

String get currentUserUid =>
    currentUser.maybeWhen(user: (user) => user.uid, orElse: () => '');

String get currentUserDisplayName =>
    currentUser.maybeWhen(user: (user) => user.displayName, orElse: () => '');

String get currentUserPhoto =>
    currentUser.maybeWhen(user: (user) => user.photoURL, orElse: () => '');

DocumentReference get currentUserReference => currentUser.maybeWhen(
    user: (user) => UserdataRecord.collection.doc(user.uid),
    orElse: () => null);
