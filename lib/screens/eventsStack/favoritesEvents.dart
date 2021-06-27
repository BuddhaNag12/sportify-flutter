import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:sportify/global_widgets/appbar.dart';

class FavoriteEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
    );
  }
}
