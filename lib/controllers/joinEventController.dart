import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/firebaseConstants.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/services/firestoreService.dart';
import 'package:sportify/utils/utils.dart';

class JoinEventController extends GetxController {
  DateTime selectedDate = DateTime.now();
  var pickedDate = ''.obs;
  var category = ''.obs;
  var prizeCat = ''.obs;
  var isLoading = false.obs;
  var eventId;
  final GlobalKey<FormState> jformKey = GlobalKey<FormState>();
  final AuthController auth = Get.find();
  /* ------------------------------- */
  final TextEditingController cJeventName = TextEditingController();
  final TextEditingController cJteamName = TextEditingController();
  final TextEditingController cJeventDescription = TextEditingController();
  final TextEditingController cjcontactForm = TextEditingController();
  final DataToFirestore fs = DataToFirestore();

  @override
  void onInit() {
    eventId = Get.parameters['id'];
    super.onInit();
  }

  applyEvent() {
    joinedEvt.add({
      'name': cJeventName.text,
      'teamName': cJteamName.text,
      'contact': cjcontactForm.text,
      'message': cjcontactForm.text,
      'eventId': eventId,
      'userId': auth.fireStoreUser.value.uid,
    }).then((value) {
      showDefaultDialog('Successfully sent join request', DialogType.warning);
      reset();
    }).catchError((onError) {
      reset();
      showDefaultDialog('Error' + onError, DialogType.warning);
    });
  }

  reset() {
    cJeventName.text = '';
    cJteamName.text = '';
    cJeventDescription.text = '';
    cjcontactForm.text = '';
  }
}
