import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:j_location_picker/j_location_picker.dart';
import 'package:sportify/models/eventDetailModel.dart';
import 'package:sportify/services/firestoreService.dart';
import 'package:sportify/constants/firebaseConstants.dart';

class EventController extends GetxController with SingleGetTickerProviderMixin {
  // for add event form
  LatLng pickedLatlng;
  DateTime selectedDate = DateTime.now();
  var pickedDate = ''.obs;
  var category = ''.obs;
  var prizeCat = ''.obs;
  var isLoading = false.obs;
//-----------------------

  Rx<EventDetailModel> eventDetails = EventDetailModel().obs;
  EventDetailModel get evtDetails => eventDetails.value;
  set evtDetails(EventDetailModel val) => this.eventDetails.value = val;

  // utility
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateFormat timeFormat = DateFormat("HH:mm");

  // form
  TabController tabController;
  final GlobalKey<FormState> createEventKey = GlobalKey<FormState>();
  var selectedIndex = 0.obs;

  /* ------------------------------- */
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventSizeController = TextEditingController();
  final TextEditingController eventDescriptionController =
      TextEditingController();
  final DataToFirestore fs = DataToFirestore();

  @override
  void onReady() {
    _initializeTabController();
    _getEventsFromFirestore();
    super.onReady();
  }

  void _reset() {
    eventNameController.clear();
    eventSizeController.clear();
    eventDescriptionController.clear();
    pickedDate.value = '';
    pickedLatlng = null;
    prizeCat.value = '';
    category.value = '';
    update();
  }

  void _showDialog(String text) {
    Get.defaultDialog(
      title: 'warning',
      titleStyle: TextStyle(color: Colors.orange),
      middleText: text,
      backgroundColor: Colors.teal,
      confirm: TextButton(
        onPressed: () => Get.back(),
        child: Text(
          "Close",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _getEventsFromFirestore() async {
    try {
      events.get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          print(result.data());
        });
      });
    } catch (err) {
      print(err);
    }
  }

  void viewEvent(id) async {
    try {
      this.isLoading.value = true;
      final res = await fs.viewEvent(id);
      eventDetails.value = res;
      this.isLoading.value = false;
    } catch (e) {
      print(e);
      this.isLoading.value = false;
    }
  }

  void createEvent() async {
    if (category.value.isBlank) {
      _showDialog('Please select a Category');
    } else if (pickedDate.value.isBlank) {
      _showDialog('Please select a Date');
    } else if (prizeCat.value.isBlank) {
      _showDialog('Please select a Prize category');
    } else if (pickedLatlng == null) {
      _showDialog('Please select a location');
    } else {
      try {
        final res = await fs.addEvent(
          eventName: eventNameController.text,
          date: pickedDate.value,
          cat: category.value,
          location: pickedLatlng,
          size: eventSizeController.text,
          desc: eventDescriptionController.text,
        );
        if (res.isNotEmpty) {
          Get.snackbar(
            'success',
            "Event successfully  added ",
            colorText: Colors.white,
          );

          _reset();
        }
      } catch (e) {
        Get.snackbar('Failure', "Failed to add Event");
      }
    }
  }

  void _initializeTabController() {
    tabController = TabController(
      initialIndex: selectedIndex.value,
      length: 2,
      vsync: this,
    );
  }

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime dPicked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
    );

    if (dPicked != null) {
      pickedDate.value = dateFormat.format(dPicked);
    }
  }

  void pickEventLocation(context) async {
    LocationResult result = await showLocationPicker(
        context, "AIzaSyCoaHfa26Cv3PH09msuFToTS3AkpWK-Ct8",
        initialCenter: LatLng(31.1975844, 29.9598339),
        myLocationButtonEnabled: true,
        layersButtonEnabled: true,
        appBarColor: Colors.tealAccent.shade700,
        desiredAccuracy: LocationAccuracy.high,
        requiredGPS: true,
        hintText: "Pick an event point",
        countries: ['india', 'usa']);
    if (result != null) {
      Get.snackbar(
        "Info",
        'Location picked successfully ${result.latLng}',
        colorText: Colors.white,
        barBlur: 1.5,
        icon: Icon(
          Icons.info_rounded,
          color: Colors.white,
        ),
        isDismissible: true,
        leftBarIndicatorColor: Colors.red,
        shouldIconPulse: true,
        borderRadius: 8,
        overlayBlur: 2.0,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 4),
      );
      pickedLatlng = result.latLng;
      update();
    }
  }

  void changeCategoryValue(String newVal) {
    this.category.value = newVal;
  }

  void setPrizeCat(String newVal) {
    this.prizeCat.value = newVal;
  }
}
