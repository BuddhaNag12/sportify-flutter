import 'package:firebase_auth/firebase_auth.dart';

import 'package:sportify/models/authUser.dart';

Future<AuthUser> signUpWithEmailPassword(
    String username, String password) async {
  // Trigger the authentication flow
  try {
    UserCredential cred = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: username, password: password);

    return AuthUser(email: cred.user.email, uid: cred.user.uid);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
    return null;
  }
  return null;
}

Future<AuthUser> signInWithEmailService(String username, String password) async {
  try {
    UserCredential cred = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password);
    return AuthUser(email: cred.user.email, uid: cred.user.uid);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  return null;
}
