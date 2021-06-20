import 'package:get/get.dart';
import 'package:sportify/controllers/authController.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
      permanent: true,
    );
  }
}
