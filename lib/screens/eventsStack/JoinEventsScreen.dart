import 'package:flutter/material.dart';
import 'package:sportify/global_widgets/appbar.dart';

class JoinEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Text("join events screen")),
      ),
    );
  }
}
