import 'package:flutter/material.dart';
import 'package:sportify/global_widgets/appbar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(
        isAvatar: false,
        isTransparent: false,
      ),
      body: Container(
        child: Text("categories"),
      ),
    );
  }
}
