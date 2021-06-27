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
}
