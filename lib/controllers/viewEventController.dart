import 'package:get/get.dart';

class ViewEventController extends GetxController {
  /* Auth State variables */
  // var isLoggedIn = false.obs;
  // var isLoading = false.obs;
  var err = ''.obs;
  var category = ''.obs;

  /* ------------------------------- */

  void changeCategoryValue(String newVal){
    this.category.value=newVal;
  }


}
