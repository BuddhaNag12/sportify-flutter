import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportify/controllers/authController.dart';
// import 'package:sportify/controllers/global_Controller.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/localWidgets.dart';

class HomeScreen extends GetView<AuthController> {
  final AuthController con = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent),
    );

    final double width = context.mediaQuery.size.width;
    final double height = context.mediaQuery.size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        isTransparent: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        width: width,
        height: height,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: width,
                    child: Image.asset('assets/bg.png', fit: BoxFit.fitWidth)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                      width: width, child: Image.asset('assets/sport.png')),
                ),
              ],
            ),
            spacer(20.0),
            Container(
              child: Column(
                children: [
                  Text("Welcome to sportify",
                      style: Theme.of(context).textTheme.headline1),
                  Text(
                    "Find what events happening around you",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  spacer(50.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () => Get.toNamed('/create'),
                          child: Text("Create Events"),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => Get.toNamed('/view_events'),
                          child: Text("View Events"),
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                          ),
                          // style: raisedButtonStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            spacer(50.0),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => con.stateUser.length > 0
                        ? loggedInWidget(con.stateUser[0].email, con)
                        : notLoggedInWidget(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget loggedInWidget(user, con) {
  return Column(children: [
    Text('welcome $user'),
    TextButton(
      onPressed: () => con.logOut(),
      child: Text(
        "Log out",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    )
  ]);
}

Widget notLoggedInWidget() {
  return Column(
    children: [
      Text("Not Logged In?"),
      TextButton(
        onPressed: () => Get.toNamed('/signin'),
        child: Text(
          "Log in",
          style: TextStyle(
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
      )
    ],
  );
}
