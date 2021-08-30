import 'package:flutter/material.dart';
import 'package:sportify/screens/exports/viewEvtexport.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Terms",
        isTransparent: false,
      ),
      body: Container(child: Text("Terms comming soon...")),
    );
  }
}