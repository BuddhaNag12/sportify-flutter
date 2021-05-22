import 'dart:async';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmapControllerForViewEvent extends GetxController{
  // map utils
  Completer<GoogleMapController> gmapController = Completer();
  final CameraPosition initialMapPositionGooglePlex = CameraPosition(
    target: LatLng(20.5937, 78.9629),
    zoom: 11,
  );

  Marker marker;
  CameraPosition _updatedCamPos;

  void updateCameraPos(lat, lng) {
    _updatedCamPos = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 11,
    );
    update();
  }

  void addMarker(lat, lng) async {
    final GoogleMapController controller = await gmapController.future;
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

  @override
  void onClose() {
    // marker = null;
    gmapController = Completer();
    super.onClose();
  }
}
