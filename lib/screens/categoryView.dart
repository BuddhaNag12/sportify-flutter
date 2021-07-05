import 'package:flutter/material.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/global_widgets/appbar.dart';

class CatViewScreen extends StatelessWidget {
  const CatViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catId = Get.parameters['id'];
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: Container(
        child: Center(
          child: Text(catId),
        ),
      ),
    );
  }
}
