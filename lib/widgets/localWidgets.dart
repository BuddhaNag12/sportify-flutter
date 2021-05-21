import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/firebaseConstants.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/controllers/eventController.dart';

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
  return FutureBuilder<QuerySnapshot>(
    future: events.get(), // async work
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return SizedBox(child: Center(child: CircularProgressIndicator()));
        default:
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          else {
            var data = snapshot.data.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, i) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Colors.grey,
                          offset: Offset(0, 1),
                        )
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp,
                        colors: [Colors.grey.shade200, Colors.teal.shade300],
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 90,
                    width: width,
                    child: InkWell(
                      onTap: () => Get.toNamed('/view_event/${data[i].id}'),
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
                          SizedBox(width: 30),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    data[i]['name'].toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Color(0xFF212121),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    spacer(5),
                                    Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 70,
                                            child: Row(
                                              children: [
                                                Icon(Icons.flag_outlined,
                                                    color: Colors.teal,
                                                    size: 18),
                                                Text(
                                                  data[i]['category'],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          SizedBox(
                                            width: 70,
                                            child: Row(
                                              children: [
                                                Icon(Icons.location_on_outlined,
                                                    color: Colors.teal,
                                                    size: 18),
                                                Text("Jirighat"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    spacer(5),
                                    Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            child: Row(
                                              children: [
                                                Icon(FlutterIcons.activity_fea,
                                                    color: Colors.teal,
                                                    size: 18),
                                                Text(
                                                  data[i]['active']
                                                      ? 'Active'
                                                      : 'Not Active',
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 40),
                                          SizedBox(
                                            width: 80,
                                            child: Row(
                                              children: [
                                                Icon(Icons.timelapse,
                                                    color: Colors.teal,
                                                    size: 18),
                                                Text(
                                                  data[i]['date'],
                                                ),
                                              ],
                                            ),
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
      }
    },
  );
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

/*
  headerCard for view event screen

*/

Widget headerCard(double width, context) {
  final EventController _con = Get.find();
  var boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    color: Colors.white30,
  );
  return Container(
    width: width,
    height: 160,
    decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.teal.shade300,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 0.8,
            offset: Offset(0, 1),
            color: Colors.grey,
          )
        ]),
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _con.evtDetails.name,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
        spacer(10.0),
        Container(
          width: width,
          padding: EdgeInsets.all(5.0),
          decoration: boxDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.flag_outlined),
                    Text(_con.evtDetails.category)
                  ],
                ),
              ),
              Container(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.timelapse),
                    Text(_con.evtDetails.date),
                  ],
                ),
              )
            ],
          ),
        ),
        spacer(10.0),
        Container(
          padding: EdgeInsets.all(5.0),
          width: width,
          decoration: boxDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on_rounded),
                      Text("Location")
                    ],
                  )),
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FlutterIcons.activity_fea),
                    SizedBox(width:20),
                    Text(_con.evtDetails.active ? "Active" : "Not Active"),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget cirCularIcon({String imgPath}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: primaryColor,
        ),
      ),
      Positioned(
        top: -80,
        left: 135,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: Offset(1.0, 5.0),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            imgPath,
            height: 110,
            width: 105,
          ),
        ),
      ),
    ],
  );
}
