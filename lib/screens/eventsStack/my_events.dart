import 'package:flutter/material.dart';
import 'package:sportify/screens/exports/createEventExport.dart';

class MyEventScreen extends StatelessWidget {
  const MyEventScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isTransparent: false),
      body: Container(
        child: Text('My All events'),
      ),
    );
  }
}
