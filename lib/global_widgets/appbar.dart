import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isTransparent;
  MyAppBar({@required this.isTransparent });

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          isTransparent ? Colors.transparent : Colors.tealAccent.shade700,
      foregroundColor: isTransparent ? null : Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: Text(
        'Sportify',
        style: Theme.of(context).textTheme.headline3,
      ),
      centerTitle: true,
      actions: [],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
