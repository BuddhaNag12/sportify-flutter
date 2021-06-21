import 'package:get/get.dart';
import 'package:sportify/controllers/signUpController.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}
