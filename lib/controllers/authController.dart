import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sportify/models/userModel.dart';
import 'package:sportify/constants/firebaseConstants.dart';

class AuthController extends GetxController {
  /* Auth State variables */
  var isLoggedIn = false.obs;
  var isLoading = false.obs;
  Rxn<User> stateUser = Rxn<User>();
  var notNul = 'user';
  Stream<User> get user => auth.authStateChanges();
  Rxn<UserModel> fireStoreUser = Rxn<UserModel>();

  // EventController evtCon = Get.find();
  void reset() {
    this.isLoggedIn.value = false;
    this.fireStoreUser.value = null;
    this.stateUser.value = null;
  }

  @override
  void onInit() {
    ever(stateUser, checkIsLoggedIn);
    stateUser.bindStream(user);
    super.onInit();
  }

  checkIsLoggedIn(_firebaseUser) async {
    this.isLoading.value = true;
    if (_firebaseUser?.uid == null) {
      this.isLoading.value = false;
    } else {
      this.isLoading.value = false;
      this.isLoggedIn.value = true;
      final res = await authUsers
          .where('uid', isEqualTo: _firebaseUser.uid.toString())
          .get();
      res.docs.forEach((element) {
        fireStoreUser.value = UserModel.fromDocumentSnapshot(element);
      });
      if(Get.currentRoute == '/signin' || Get.currentRoute == '/signup' ){
        Get.offAndToNamed('/view_events');
      }
    }
  }

  void logOut() {
    auth.signOut().then((_) {
      reset();
    });
  }
}
