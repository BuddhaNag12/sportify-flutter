import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/firebaseConstants.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/utils/utils.dart';

class ProfileController extends GetxController {
  final AuthController _auth = Get.find();
  final EventController evtCon = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  var role = UserRoll.participating.obs;
  var isLoading = false.obs;

  updateProfile() {
    this.isLoading.value = true;
    authUsers.doc(_auth.stateUser.value.uid).update({
      'name': nameController.text,
      'role':
          role.value == UserRoll.participating ? "Participant" : "Event Master",
    }).then((value) {
      showMessageDialog('Profile updated');
      fetchEventRole();
      this.isLoading.value = false;
    }).catchError((error) {
      showMessageDialog('Error on updation');
      this.isLoading.value = false;
    });
  }

  changeRole(role) {
    this.role.value = role;
  }

  fetchEventRole() {
    authUsers.doc(_auth.stateUser.value.uid).get().then((value) {
      if (value.data()['name'] != null) {
        nameController.text = value.data()['name'];
      }
      if (value.data()['role'] == 'Participant') {
        this.role.value = UserRoll.participating;
      } else {
        this.role.value = UserRoll.eventmaster;
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void onInit() {
    emailController.text = _auth.stateUser.value.email;
    fetchEventRole();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
