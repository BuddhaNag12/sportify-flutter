import 'package:flutter/material.dart';
import 'package:sportify/screens/exports/viewEvtexport.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Privacy",
        isTransparent: false,
      ),
      body: Container(child: Text("privacy comming soon...")),
    );
  }
}
