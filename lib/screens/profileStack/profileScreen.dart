
import 'package:flutter/material.dart';

import 'package:sportify/global_widgets/appbar.dart';

class ProfileScreen extends StatelessWidget {


  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isAvatar: false,
        isTransparent: false,
      ),
      body: Container(
        child: SizedBox()
      ),
    );
  }
}
