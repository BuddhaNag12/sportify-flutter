import 'package:flutter/material.dart';
import 'package:sportify/global_widgets/appbar.dart';


class ViewEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          isTransparent: false,
        ),
        body: Container(
          child: Center(child: Text("View Events")),
        ));
  }
}
