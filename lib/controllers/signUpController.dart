import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/firebaseConstants.dart';
import 'package:sportify/services/authServices.dart';
import 'package:sportify/utils/utils.dart';

class SignUpController extends GetxController {

  var isLoading = false.obs;
  var err = ''.obs;

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  // Service class
  final FirebaseAuthentication _authService = new FirebaseAuthentication();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passWordController.dispose();
  }

  signUpWithEmail() async {
    this.isLoading.value = true;

    try {
      final userEmail = emailController.text;
      final password = passWordController.text;
      final response =
          await _authService.signUpWithEmailPassword(userEmail, password);
      if (response != null) {
        authUsers.doc(response.uid).set({
          'email': response.email,
          'uid': response.uid,
          'password': password,
          'name': '',
          'role': 'Event Master'
        });

        this.isLoading.value = false;
      }
    } catch (e) {
      // reset();
      // print('from con ${e.errMsg()}');
      showMessageDialog('${e.errMsg()}');
      this.err.value = e.errMsg();
      isLoading.value = false;
    }
  }

}
