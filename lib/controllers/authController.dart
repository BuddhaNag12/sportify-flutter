import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportify/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:sportify/constants/firebaseConstants.dart';

class AuthController extends GetxController {
  /* Auth State variables */
  var isLoggedIn = false.obs;
  var isLoading = false.obs;
  var err = ''.obs;
  var category = ''.obs;
  List<dynamic> stateUser=[].obs;
  /* ------------------------------- */
 
 
  /* Auth State Controllers */
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final FirebaseAuthentication _authService = new FirebaseAuthentication();
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /* ------------------------------- */

  // Utility Methods
  void showDialog(msg) {
    Get.snackbar(
      'Info',
      '$msg',
      colorText: Colors.white,
      barBlur: 1.5,
      icon: Icon(
        Icons.info_rounded,
        color: Colors.white,
      ),
      isDismissible: true,
      leftBarIndicatorColor: Colors.red,
      shouldIconPulse: true,
      borderRadius: 8,
      // overlayBlur: 2.0,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.teal,
      duration: Duration(seconds: 4),
    );
  }

  void reset() {
    this.err.value = '';
    this.isLoggedIn.value = false;
    this.stateUser.length=0;
    emailController.text = '';
    passWordController.text = '';
  }

  @override
  void onInit() {
    checkIsLoggedIn();
    super.onInit();
  }

  Future<void> signUpWithEmail() async {
    this.isLoading.value = true;
    try {
      final userEmail = emailController.text;
      final password = passWordController.text;
      final response =
          await _authService.signUpWithEmailPassword(userEmail, password);
      if (response != null) {
        isLoading.value = false;
        Get.toNamed('/signin');
      }
    } catch (e) {
      reset();
      print('from con ${e.errMsg()}');
      this.showDialog('${e.errMsg()}');
      this.err.value = e.errMsg();
      isLoading.value = false;
    }
  }

  Future<void> signInWithEmail() async {
    this.isLoading.value = true;

    try {
      final userEmail = emailController.text;
      final password = passWordController.text;
      final response =
          await _authService.signInWithEmailService(userEmail, password);
      if (response != null) {
        this.isLoggedIn.value = true;
        this.isLoading.value = false;
        Get.offNamed('/view_events');
      }
    } catch (e) {
      reset();
      this.showDialog('Password Invalid');
      this.err.value = e.errMsg();
      isLoading.value = false;
    }
  }

  Future<void> checkIsLoggedIn() async {
    auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        this.showDialog('User is currently signed out!');
      } else {
        print('User is signed in!');
        this.isLoggedIn.value = true;
        this.stateUser.add(user);
      }
    });
  }

  void logOut() {
    auth.signOut().then((s) {
      reset();
    });
  }
}
