import 'package:flutter/material.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/global_widgets/appbar.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
        isAvatar: false,
      ),
      backgroundColor: primaryColor,
      body: Container(
        color: primaryColorLight,
        child: Center(child: Text("Opps.... Route not found ☹")),
      ),
    );
  }
}
