import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/colorConst.dart';
// import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/global_widgets/appbar.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key key}) : super(key: key);
  final EventController con = Get.find();
  final AuthController _authCon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(isTransparent: false, isAvatar: false, title: "Settings"),
      body: Container(
          child: ListView(
        children: [
          ...settingsList.map(
            (e) => SizedBox(
              width: width * 0.80,
              child: ListTileTheme(
                dense: true,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        e.title,
                        style: subtitle1.copyWith(color: Colors.black45),
                      ),
                      onTap: () => Get.toNamed(e.route),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => _authCon.isLoggedIn.isFalse
                ? ListTileTheme(
                    dense: true,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Sign In",
                            style:
                                subtitle1.copyWith(color: primaryColor),
                          ),
                          onTap: () => Get.toNamed('/signin'),
                        ),
                      ],
                    ),
                  )
                : ListTileTheme(
                    dense: true,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Log Out",
                            style: subtitle1.copyWith(color: Colors.redAccent),
                          ),
                          onTap: () => _authCon.logOut(),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      )),
    );
  }
}
