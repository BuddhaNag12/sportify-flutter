import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/screens/exports/createEventExport.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isTransparent;
  final bool isAvatar;
  final bool isMultiselect;
  final String title;
  final AuthController con = Get.find();
  MyAppBar({
    @required this.isTransparent,
    this.title,
    this.isAvatar = false,
    this.isMultiselect = false,
  });
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isTransparent ? Colors.transparent : primaryColor,
      foregroundColor: isTransparent ? null : Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title ?? 'Sportify',
        style:
            title != null ? headline2.copyWith(color: Colors.white) : headline3,
      ),
      // centerTitle: true,
      actions: [
        isAvatar
            ? IconButton(
                icon: Icon(
                  CupertinoIcons.person_crop_circle_fill,
                ),
                onPressed: () {
                  Get.toNamed('/profile');
                  // : Get.toNamed('/signin');
                })
            : SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
