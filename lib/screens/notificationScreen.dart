import 'package:flutter/material.dart';
import 'package:sportify/screens/exports/viewEvtexport.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Notification",
        isTransparent: false,
      ),
      body: Container(child: Text("Notifications comming soon...")),
    );
  }
}
