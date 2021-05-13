import 'package:firebase_auth/firebase_auth.dart';
import 'package:sportify/services/errorService.dart';
import 'package:sportify/constants/firebaseConstants.dart';

class FirebaseAuthentication {
  var error;

  Future<User> signUpWithEmailPassword(String username, String password) async {
    try {
      UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: username.trim(), password: password.trim());
      return cred.user;
    } on FirebaseAuthException catch (e) {
      this.error = e.code;
      print(e.code);
      if (e.code == 'weak-password') {
        throw new WeakPassword();
      } else if (e.code == 'email-already-in-use') {
        throw new EmailExist();
      } else if (e.code == 'invalid-email') {
        throw new InvalidEmail();
      }
      return null;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<User> signInWithEmailService(String username, String password) async {
    try {
      UserCredential cred = await auth.signInWithEmailAndPassword(
          email: username.trim(), password: password.trim());
      return cred.user;
    } on FirebaseAuthException catch (e) {
      this.error = e.code;
      if (e.code == 'user-not-found') {
        throw new UserNotFound();
      } else if (e.code == 'wrong-password') {
        throw new WrongPassword();
      } else if (e.code == 'invalid-email') {
        throw new InvalidEmail();
      }
      return null;
    } catch (err) {
      print(err);
      return null;
    }
  }
}
