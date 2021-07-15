import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/global_widgets/appbar.dart';

class MyAccount extends StatelessWidget {
  final AuthController _auth = Get.find();
  final EventController _eventCon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isAvatar: false,
        isTransparent: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              // color: primaryColor,
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    primaryColorLight,
                                    primaryColorDark,
                                  ]),
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
                                                    cacheWidth: 50,
                                                    cacheHeight: 50,
                                                    alignment: Alignment.center,
                                                    loadingBuilder: (
                                                      BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent
                                                          loadingProgres,
                                                    ) =>
                                                        loadingProgres == null
                                                            ? child
                                                            : CircularProgressIndicator(
                                                                value: loadingProgres
                                                                            .expectedTotalBytes !=
                                                                        null
                                                                    ? loadingProgres
                                                                            .cumulativeBytesLoaded /
                                                                        loadingProgres
                                                                            .expectedTotalBytes
                                                                    : null,
                                                              ),
                                                  )
                                                : Image.network(
                                                    'https://ui-avatars.com/api/?name=G',
                                                    cacheWidth: 50,
                                                    cacheHeight: 50,
                                                    alignment: Alignment.center,
                                                    loadingBuilder: (
                                                      BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent
                                                          loadingProgres,
                                                    ) =>
                                                        loadingProgres == null
                                                            ? child
                                                            : CircularProgressIndicator(),
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
                                          width: width / 2,
                                          child: Text(
                                            _auth.fireStoreUser?.value?.email ??
                                                'Guest User',
                                            overflow: TextOverflow.ellipsis,
                                            style: headline6.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
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
                          bottom: -10,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: width,
                            height: 40,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    primaryColorLight,
                                    primaryColorDark,
                                  ]),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Event Planner Mode",
                                    style: caption,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Obx(
                                    () => Switch(
                                      activeColor: Colors.tealAccent.shade400,
                                      // trackColor: Colors.teal,
                                      value: _eventCon.isEventMaster.value,
                                      onChanged: (value) {
                                        _eventCon.setEventPlannerMode(value);
                                      },
                                    ),
                                  ),
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
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "My Sportify",
                      style: headline4.copyWith(fontSize: 25),
                    ),
                  ),

                  ListTileTheme(
                    dense: true,
                    child: Column(
                      children: [
                        ListTile(
                          leading: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "My Profile",
                            style: subtitle1.copyWith(color: Colors.black45),
                          ),
                          onTap: () => Get.toNamed('/'),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => _eventCon.isEventMaster.isTrue
                        ? ListTileTheme(
                            dense: true,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        child: Icon(
                                          Icons.inbox_rounded,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "Joinee Request",
                                    style: subtitle1.copyWith(
                                        color: Colors.black45),
                                  ),
                                  onTap: () => Get.toNamed('/'),
                                  trailing: Icon(Icons.arrow_right),
                                ),
                              ],
                            ),
                          )
                        : ListTileTheme(
                            dense: true,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        child: Icon(
                                          FlutterIcons.send_circle_mco,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "Sent Requests",
                                    style: subtitle1.copyWith(
                                        color: Colors.black45),
                                  ),
                                  onTap: () => Get.toNamed('/'),
                                  trailing: Icon(Icons.arrow_right),
                                ),
                              ],
                            ),
                          ),
                  ),

                  Obx(
                    () => _eventCon.isEventMaster.isTrue
                        ? ListTileTheme(
                            dense: true,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        child: Icon(
                                          Icons.event,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "Manage Events",
                                    style: subtitle1.copyWith(
                                        color: Colors.black45),
                                  ),
                                  onTap: () => Get.toNamed('/'),
                                  trailing: Icon(Icons.arrow_right),
                                ),
                              ],
                            ),
                          )
                        : ListTileTheme(
                            dense: true,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        child: Icon(
                                          Icons.favorite,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "Favorites",
                                    style: subtitle1.copyWith(
                                        color: Colors.black45),
                                  ),
                                  onTap: () => Get.toNamed('/'),
                                  trailing: Icon(Icons.arrow_right),
                                ),
                              ],
                            ),
                          ),
                  ),

                  // static list view
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "General",
                      style: headline4.copyWith(fontSize: 25),
                    ),
                  ),
                  ...generalSettings.map(
                    (e) => SizedBox(
                      width: width * 0.80,
                      child: ListTileTheme(
                        dense: true,
                        child: Column(
                          children: [
                            ListTile(
                              leading: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    child: Icon(
                                      e.icon,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                e.name,
                                style:
                                    subtitle1.copyWith(color: Colors.black45),
                              ),
                              onTap: () => Get.toNamed(e.route),
                              trailing: Icon(Icons.arrow_right),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
