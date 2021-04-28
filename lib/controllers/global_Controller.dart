import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportify/services/authServices.dart';

class GlobalController extends GetxController {
  var isLoggedIn = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  var category = ''.obs;
  void loginWithGoogle() async {}

  void logout() {}

  void changeCategoryValue(String val) {
    this.category.value = val;
  }

  Future<void> signUpWithEmail() async {
    final userEmail = emailController.text;
    final password = passWordController.text;
    final response = await signUpWithEmailPassword(userEmail, password);
    if (response.uid.isNotEmpty) {
      this.isLoggedIn.value = true;
      Get.toNamed('/signin');
    }
    print(response);
  }

  Future<void> signInWithEmail() async {
    final userEmail = emailController.text;
    final password = passWordController.text;
    final response = await signInWithEmailService(userEmail, password);
    if (response != null) {
      print(response);
      this.isLoggedIn.value = true;
    }
  }
}
