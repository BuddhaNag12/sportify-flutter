import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:sportify/controllers/global_Controller.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/colorConst.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isTransparent;
  final bool isAvatar;
  MyAppBar({this.isTransparent, this.isAvatar = false});
  Widget build(BuildContext context) {
    return AppBar(
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
      actions: [
        // IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () => Get.bottomSheet(
        //     Container(
        //       color: primaryColorDark,
        //       child: Wrap(
        //         children: [
        //           ListTile(
        //             leading: Icon(Icons.account_circle,color: Colors.white,),
        //             title: Text('Profile'),
        //             onTap: () => Get.toNamed('/profile'),
        //           ),
        //           ListTile(
        //             leading: Icon(Icons.today_outlined,color: Colors.white,),
        //             title: Text('Manage Events'),
        //             onTap: () => Get.toNamed('/profile'),
        //           ),
        //           ListTile(
        //             leading: Icon(Icons.notification_important,color: Colors.white,),
        //             title: Text('Notifications'),
        //           ),
        //           ListTile(
        //             leading: Icon(Icons.settings,color: Colors.white,),
        //             title: Text('Settings'),
        //           ),
        //           ListTile(
        //             leading: Icon(Icons.info,color: Colors.white,),
        //             title: Text('About'),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
