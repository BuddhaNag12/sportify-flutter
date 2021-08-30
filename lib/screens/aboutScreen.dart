import 'package:flutter/material.dart';
import 'package:sportify/screens/exports/viewEvtexport.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "About",
        isTransparent: false,
      ),
      body: Container(child: Text("About comming soon...")),
    );
  }
}
