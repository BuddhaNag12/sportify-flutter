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
  /* Auth State variables */
  final Completer<GoogleMapController> gmapController = Completer();
  LatLng latlng = LatLng(24.8333, 92.7789);

  LatLng pickedLatlng;
  DateTime selectedDate = DateTime.now();
  var pickedDate = ''.obs;
  var category = ''.obs;
  var prizeCat = ''.obs;

  Rx<EventDetailModel> eventDetails = EventDetailModel().obs;
  EventDetailModel get evtDetails => eventDetails.value;
  set evtDetails(EventDetailModel val) => this.eventDetails.value = val;


  // utility

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateFormat timeFormat = DateFormat("HH:mm");

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(24.8333, 92.7789),
    zoom: 11,
  );

  Marker marker;
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
    initializeTabController();
    fake(24.8170, 93.9368);
    _getEventsFromFirestore();
    super.onReady();
  }

  void reset() {
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
          // eventList.addAll(result.data());
        });
      });
    } catch (err) {
      print(err);
    }
  }

  void viewEvent(id) async {
    try {
      final res = await fs.viewEvent(id);
      // print("${res.id},${res.name}");
      eventDetails.value = res;
    } catch (e) {
      print(e);
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

          reset();
        }
      } catch (e) {
        Get.snackbar('Failure', "Failed to add Event");
      }
    }
  }

  void fake(double lat, double lng) {
    Future.delayed(Duration(milliseconds: 500), () {
      latlng = LatLng(lat, lng);
      kGooglePlex = CameraPosition(
        target: LatLng(lat, lng),
        zoom: 11,
      );
    });
    update();
  }

  void initializeTabController() {
    tabController = TabController(
      initialIndex: selectedIndex.value,
      length: 2,
      vsync: this,
    );
  }

  void addMarker() {
    marker = Marker(
      markerId: MarkerId("home"),
      position: latlng,
      draggable: false,
      zIndex: 2,
      flat: true,
      anchor: Offset(0.5, 0.5),
    );
    update();
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
