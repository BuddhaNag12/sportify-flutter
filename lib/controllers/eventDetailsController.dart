import 'dart:async';
// import 'dart:html';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportify/constants/firebaseConstants.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/models/eventDetailModel.dart';
import 'package:sportify/models/favModel.dart';
import 'package:sportify/services/firestoreService.dart';
import 'package:sportify/utils/utils.dart';

class EventDetailsController extends GetxController
    with SingleGetTickerProviderMixin {
  // map utils
  Completer<GoogleMapController> gmapController = Completer();
  final CameraPosition initialMapPositionGooglePlex = CameraPosition(
    target: LatLng(20.5937, 78.9629),
    zoom: 11,
  );
  Rxn<FavModel> favorites = Rxn<FavModel>();
  Marker marker;
  CameraPosition _updatedCamPos;
  var isLoading = false.obs;
  Rx<EventDetailModel> eventDetails = EventDetailModel().obs;
  EventDetailModel get evtDetails => eventDetails.value;
  set evtDetails(EventDetailModel val) => this.eventDetails.value = val;
  final DataToFirestore fs = DataToFirestore();
  GoogleMapController controller;
  final AuthController _auth = Get.find();

  AnimationController iconAnimation;

  void updateCameraPos(lat, lng) {
    _updatedCamPos = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 11,
    );
    update();
  }

  void addMarker(lat, lng) async {
    controller = await gmapController.future;
    updateCameraPos(lat, lng);
    marker = Marker(
      markerId: MarkerId("home"),
      position: LatLng(lat, lng),
      draggable: false,
      zIndex: 2,
      flat: true,
      anchor: Offset(0.5, 0.5),
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(_updatedCamPos));
    update();
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

  addEventToFavorite(eventid, userId) async {
    favEvts.doc(userId).get().then((value) {
      if (value.data() != null) {
        if (!value.data()['evt_favs'].contains(eventid)) {
          favEvts.doc(userId).set({
            'evt_favs': [...value.data()['evt_favs'], eventid],
            'user_id': userId,
          }).then((_) {
            showMessageDialog("Added to favorite");
            iconAnimation.forward();
          }).catchError((onError) {
            showMessageDialog("Error adding to favorite");
          });
        } else if (value.data()['evt_favs'].contains(eventid)) {
          final filteredEvents =
              value.data()['evt_favs'].where((i) => i != eventid).toList();
          favEvts.doc(userId).set({
            'evt_favs': [...filteredEvents],
            'user_id': userId,
          }).then((_) {
            showMessageDialog("Removed from favorite");
            iconAnimation.reverse();
          }).catchError((onError) {
            showMessageDialog("Error adding to favorite");
          });
        }
        getFavorites();
      } else {
        favEvts.doc(userId).set({
          'evt_favs': [eventid],
          'user_id': userId,
        });
        getFavorites();
      }
    }).catchError((onError) => {showMessageDialog(onError)});
  }

  getFavorites() {
    favEvts.doc(_auth.stateUser.value.uid).get().then((value) {
      if (value.exists) {
        favorites.value = FavModel.fromDocumentSnapshot(value);
      }
    });
  }

  @override
  void onInit() async {
    iconAnimation = AnimationController(
      vsync: this,
      reverseDuration: Duration(milliseconds: 600),
      duration: Duration(milliseconds: 1000),
    );

    getFavorites();
    super.onInit();
  }

  @override
  void onClose() {
    marker = null;
    // gmapController = Completer();
    controller.dispose();
    eventDetails.value = null;
    iconAnimation.dispose();
    super.onClose();
  }
}
