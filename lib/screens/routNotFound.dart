import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset('assets/pageNotFound.svg',
                  width: 250, height: 250),
              Text("Opps.... Route not found ☹")
            ],
          ),
        ),
      ),
    );
  }
}
