import 'package:flutter/material.dart';
import 'package:sportify/global_widgets/appbar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isAvatar:false,
        isTransparent:false,
      ),
      body: Container(child:Text("ProfileScreen")),
    );
  }
}