import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/services/firestoreService.dart';

class JoinEventController extends GetxController {
  DateTime selectedDate = DateTime.now();
  var pickedDate = ''.obs;
  var category = ''.obs;
  var prizeCat = ''.obs;
  var isLoading = false.obs;

    final GlobalKey<FormState> jformKey = GlobalKey<FormState>();
  /* ------------------------------- */
  final TextEditingController cJeventName = TextEditingController();
  final TextEditingController cJteamName = TextEditingController();
  final TextEditingController cJeventDescription = TextEditingController();
  final DataToFirestore fs = DataToFirestore();

  // void _reset() {
  //   pickedDate.value = '';
  //   prizeCat.value = '';
  //   category.value = '';
  //   update();
  // }

  // void _showDialog(String text) {
  //   Get.defaultDialog(
  //     title: 'warning',
  //     titleStyle: TextStyle(color: Colors.orange),
  //     middleText: text,
  //     backgroundColor: Colors.teal,
  //     confirm: TextButton(
  //       onPressed: () => Get.back(),
  //       child: Text(
  //         "Close",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  void createEvent() async {}
}
