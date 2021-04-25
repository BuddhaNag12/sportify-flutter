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
  final List listItems = new List(20);

  return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (_, int index) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.grey.shade50, Colors.tealAccent.shade700])),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 90,
          width: context.mediaQuery.size.width,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  FlutterIcons.event_mdi,
                  size: 40,
                ),
              ),
              SizedBox(width: 20),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "jiri youth tournament".toUpperCase(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    spacer(5),
                    Container(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.flag_outlined, color: Colors.teal),
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
          ),
        );
      });
}

class MyDrawer extends StatelessWidget{
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
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ));
  }
}
