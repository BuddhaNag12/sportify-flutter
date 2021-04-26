import 'package:get/get.dart';

class GlobalController extends GetxController {
  final isLoggedIn = true.obs;
  var category=''.obs;
  void loginWithGoogle() async {}

  void logout() {}

  void changeCategoryValue(String val){
    this.category.value=val;
  }
}
