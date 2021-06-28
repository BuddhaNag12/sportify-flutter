import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sportify/constants/colorConst.dart';
// import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/global_widgets/appbar.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key key}) : super(key: key);
  final EventController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
        isAvatar: false,
      ),
      body: Container(
        child: Column(
          children: [
            Text("setting screen"),
            Container(
              width: width,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Obx(
                () => DropdownButton<NavBarStyle>(
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Bottom bar style",
                    ),
                  ),
                  value: !con.navBarStyle.value.isBlank
                      ? con.navBarStyle.value
                      : null,
                  elevation: 8,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: "Roboto",
                  ),
                  dropdownColor: primaryColor,
                  underline: SizedBox(),
                  onChanged: (newValue) {
                    con.changeBottomStyle(newValue);
                  },
                  items: NavBarStyle.values.map((val) {
                    String name = val
                        .toString()
                        .substring(val.toString().indexOf('.') + 1);
                    return DropdownMenuItem(
                      value: val,
                      child: Container(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            width: paddedWidth,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Text(name)),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
