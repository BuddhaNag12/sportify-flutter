import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final con;
  final bool isTransparent;
  final bool isAvatar;
  final bool isMenuEnabled;
  MyAppBar({
    this.isTransparent,
    this.isAvatar = false,
    this.isMenuEnabled = false,
    this.con,
  });
  Widget build(BuildContext context) {
    return AppBar(
      leading: !isTransparent
          ? IconButton(
              alignment: Alignment.center,
              icon: Icon(
                FlutterIcons.arrow_left_sli,
                color: Colors.white,
                size: 20,
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
      actions: [
        isMenuEnabled
            ? IconButton(
                icon: SvgPicture.asset(
                  'assets/menu-right.svg',
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
                onPressed: () {
                  con.openDrawerkey.currentState.openEndDrawer();
                })
            : SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
