import 'package:get/get.dart';
import 'package:sportify/controllers/signinController.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
