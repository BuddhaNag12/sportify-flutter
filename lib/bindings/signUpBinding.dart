import 'package:get/get.dart';
import 'package:sportify/controllers/singUpController.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}
