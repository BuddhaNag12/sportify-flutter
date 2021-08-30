import 'package:flutter/material.dart';
import 'package:sportify/screens/exports/viewEvtexport.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Support",
        isTransparent: false,
      ),
      body: Container(child: Text("Support comming soon...")),
    );
  }
}