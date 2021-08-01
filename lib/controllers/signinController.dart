import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportify/services/authServices.dart';
import 'package:sportify/utils/utils.dart';

class SignInController extends GetxController {
  var isLoading = false.obs;
  var err = ''.obs;
  
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // Service class
  final FirebaseAuthentication _authService = new FirebaseAuthentication();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController(text: '123123');

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passWordController.dispose();
  }

  signInWithEmail() async {
    this.isLoading.value = true;
    try {
      final userEmail = emailController?.text;
      final password = passWordController?.text;
      final response =
          await _authService.signInWithEmailService(userEmail, password);
      if (response != null) {
        this.isLoading.value = false;
      }
    } catch (e) {
      showMessageDialog('Password Invalid');
      this.err.value = e.errMsg();
      isLoading.value = false;
    }
  }
}
