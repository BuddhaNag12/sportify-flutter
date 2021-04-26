import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

/* 

gives spacing acroding to given height

*/
Widget spacer(double height) {
  return SizedBox(height: height);
}

/*

  ListView 
  Events cards view

*/

Widget buildListView(BuildContext context) {
  final List listItems = List.filled(10, 'hello');

  return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (_, int index) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 2, color: Colors.grey, offset: Offset(0, 1))
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp,
                colors: [Colors.grey.shade200, Colors.teal.shade300]),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 90,
          width: context.mediaQuery.size.width,
          child: InkWell(
            onTap: () => Get.toNamed('/view_event'),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  child: Icon(
                    FlutterIcons.event_mdi,
                    size: 40,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: new Container(
                        margin: new EdgeInsets.only(top: 5.0),
                        child: new Text(
                          'JIRI sports academy',
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 22.0,
                            color: new Color(0xFF212121),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacer(5),
                          Container(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.flag_outlined,
                                        color: Colors.teal),
                                    Text("Cricket"),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        color: Colors.teal),
                                    Text("Jirighat"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          spacer(5),
                          Container(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(FlutterIcons.activity_fea,
                                        color: Colors.teal),
                                    Text("Active"),
                                  ],
                                ),
                                SizedBox(width: 25),
                                Row(
                                  children: [
                                    Icon(Icons.timelapse,
                                        size: 20, color: Colors.teal),
                                    Text("20-20-2021"),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        );
      });
}

/*


  Drawer widget for sidebar placed in home screen
  To customized we separated the widget to localwidgets

*/
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.teal, boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.grey,
              offset: Offset(0, 1),
            ),
          ]),
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/bg.png',
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                    bottom: 50,
                    left: 40,
                    child: Icon(
                      FlutterIcons.user_ant,
                      size: 50,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () => Get.toNamed('/profile'),
        ),
        ListTile(
          leading: Icon(Icons.today_outlined),
          title: Text('Manage Events'),
          onTap: () => Get.toNamed('/profile'),
        ),
        ListTile(
          leading: Icon(Icons.notification_important),
          title: Text('Notifications'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
        ),
      ],
    ));
  }
}
