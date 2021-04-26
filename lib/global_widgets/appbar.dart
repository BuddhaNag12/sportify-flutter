import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:sportify/controllers/global_Controller.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isTransparent;
  final bool isAvatar;
  MyAppBar({this.isTransparent, this.isAvatar = false});
  Widget build(BuildContext context) {
    // final GlobalController con = Get.put(GlobalController());

    return AppBar(
      // leading: isAvatar
      //     ? IconButton(
      //         icon: Icon(FlutterIcons.user_circle_faw), onPressed: () => con.isLoggedIn.value?Get.toNamed('/profile'):Get.toNamed('/signin'))
      //     :
      leading: !isTransparent
          ? IconButton(
              alignment: Alignment.center,
              icon: Icon(
                FlutterIcons.arrow_left_sli,
                color: Colors.white,
              ),
              onPressed: () => Get.back())
          : SizedBox(),
      backgroundColor:
          isTransparent ? Colors.transparent : Colors.tealAccent.shade700,
      foregroundColor: isTransparent ? null : Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'Sportify',
        style: Theme.of(context).textTheme.headline3,
      ),
      centerTitle: true,
      actions: [],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
