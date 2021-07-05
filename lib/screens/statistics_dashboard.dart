import 'package:flutter/material.dart';
import 'package:sportify/global_widgets/appbar.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: Container(
        child: Text("Statistics"),
      ),
    );
  }
}
