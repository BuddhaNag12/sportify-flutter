import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/authController.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isTransparent;
  final bool isAvatar;
  final AuthController con = Get.find();
  MyAppBar({
    this.isTransparent,
    this.isAvatar = false,
  });
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isTransparent ? Colors.transparent : primaryColor,
      foregroundColor: isTransparent ? null : Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'Sportify',
        style: headline3,
      ),
      // centerTitle: true,
      actions: [
        isAvatar
            ? IconButton(
                icon: Icon(
                  CupertinoIcons.person_crop_circle_fill,
                ),
                onPressed: () {
                  con.stateUser.value != null
                      ? Get.toNamed('/profile')
                      : Get.toNamed('/signin');
                })
            : SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
