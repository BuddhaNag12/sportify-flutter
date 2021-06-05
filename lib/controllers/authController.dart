import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportify/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:sportify/constants/firebaseConstants.dart';
import 'package:sportify/utils/utils.dart';

class AuthController extends GetxController {
  /* Auth State variables */
  var isLoggedIn = false.obs;
  var isLoading = false.obs;
  var err = ''.obs;
  var category = ''.obs;
  Rxn<User> stateUser = Rxn<User>();
  Stream<User> get user => auth.authStateChanges();

  /* Auth State Controllers */
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  // Service class
  final FirebaseAuthentication _authService = new FirebaseAuthentication();

  // Keys
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void reset() {
    this.err.value = '';
    this.isLoggedIn.value = false;
    this.stateUser.value = null;
    emailController.text = '';
    passWordController.text = '';
  }

  @override
  void onClose() {
    emailController.dispose();
    passWordController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    ever(stateUser, checkIsLoggedIn);
    stateUser.bindStream(user);
    super.onReady();
  }

  signUpWithEmail() async {
    this.isLoading.value = true;
    try {
      final userEmail = emailController.text;
      final password = passWordController.text;
      final response =
          await _authService.signUpWithEmailPassword(userEmail, password);
      if (response != null) {
        authUsers.add({
          'email': response.email,
          'uid': response.uid,
          'password': password,
          'name': '',
          'role': ''
        });
        this.isLoading.value = false;
      }
    } catch (e) {
      reset();
      // print('from con ${e.errMsg()}');
      showMessageDialog('${e.errMsg()}');
      this.err.value = e.errMsg();
      isLoading.value = false;
    }
  }

  signInWithEmail() async {
    this.isLoading.value = true;
    try {
      final userEmail = emailController?.text;
      final password = passWordController?.text;
      final response =
          await _authService.signInWithEmailService(userEmail, password);
      if (response != null) {
        this.isLoggedIn.value = true;
        this.isLoading.value = false;
      }
    } catch (e) {
      reset();
      showMessageDialog('Password Invalid');
      this.err.value = e.errMsg();
      isLoading.value = false;
    }
  }

  checkIsLoggedIn(_firebaseUser) async {
    if (_firebaseUser?.uid == null) {
      showMessageDialog('User is currently signed out!');
    } else {
      this.isLoggedIn.value = true;
      await Get.offAllNamed('/home');
    }
  }

  void logOut() {
    auth.signOut().then((s) {
      reset();
    });
  }
}
