import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/global_widgets/appbar.dart';

class MyAccount extends StatelessWidget {
  final AuthController _auth = Get.find();
  // final EventController _eventCon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isAvatar: false,
        isTransparent: false,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    width: width,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        DrawerHeader(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  color: Colors.grey,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: ClipOval(
                                      child: Obx(
                                        () =>
                                            _auth.fireStoreUser.value != null &&
                                                    _auth.fireStoreUser.value
                                                        .email.isNotEmpty
                                                ? Image.network(
                                                    'https://ui-avatars.com/api/?name=${_auth.fireStoreUser.value.email.characters.characterAt(0)}',
                                                    alignment: Alignment.center,
                                                  )
                                                : Image.network(
                                                    'https://ui-avatars.com/api/?name=G',
                                                    alignment: Alignment.center,
                                                  ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Obx(
                                    () => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            _auth.fireStoreUser?.value?.email ??
                                                'Guest User',
                                            style: headline6.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          child: Text(
                                            'Role: todo',
                                            // "ROLE: ${_eventCon.isEventMaster.isTrue ? 'Event Master' : 'Participant'}",
                                            textAlign: TextAlign.start,
                                            style: caption.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  SizedBox(
                                    child: IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        FlutterIcons.notifications_mdi,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Positioned(
                          bottom: -5,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: width,
                            height: 40,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              color: primaryColorDark,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.9, 1),
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Event Planner Mode",
                                  style: caption,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CupertinoSwitch(
                                    activeColor: Colors.tealAccent.shade400,
                                    trackColor: Colors.teal,
                                    value: false,
                                    onChanged: (value) {
                                      // _eventCon.isEventMaster.value = value;
                                    },
                                  ),
                                  // child: Obx(
                                  //   () => CupertinoSwitch(
                                  //     activeColor: Colors.tealAccent.shade400,
                                  //     trackColor: Colors.teal,
                                  //     value: false,
                                  //     onChanged: (value) {
                                  //       // _eventCon.isEventMaster.value = value;
                                  //     },
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Profile',
                style: subtitle1.copyWith(color: Colors.black45),
              ),
              onTap: () => Get.toNamed('/profile'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.plus_circle),
              title: Text(
                'Create Events',
                style: subtitle1.copyWith(color: Colors.black45),
              ),
              onTap: () => Get.toNamed('/create'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.today_outlined),
              title: Text(
                'Manage Events',
                style: subtitle1.copyWith(color: Colors.black45),
              ),
              onTap: () => Get.toNamed('/'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.favorite_outline),
              title: Text(
                'Favorites',
                style: subtitle1.copyWith(color: Colors.black45),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              onTap:()=> Get.toNamed('/setting'),
              title: Text(
                'Setting',
                style: subtitle1.copyWith(color: Colors.black45),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                'About',
                style: subtitle1.copyWith(color: Colors.black45),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
            Obx(
              () => _auth.isLoggedIn.isTrue
                  ? ListTile(
                      leading: Icon(Icons.logout),
                      title: Text(
                        'Log Out',
                        style: subtitle1.copyWith(color: Colors.black45),
                      ),
                      onTap: () => _auth.logOut(),
                    )
                  : ListTile(
                      leading: Icon(Icons.login_outlined),
                      title: Text(
                        'Log in',
                        style: subtitle1.copyWith(color: Colors.black45),
                      ),
                      onTap: () => Get.toNamed('/signin'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
