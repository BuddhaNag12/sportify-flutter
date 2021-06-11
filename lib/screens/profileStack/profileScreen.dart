
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/controllers/authController.dart';

import 'package:sportify/global_widgets/appbar.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController _auth = Get.find();
  

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
