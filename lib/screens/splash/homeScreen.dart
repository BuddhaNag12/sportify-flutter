import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/localWidgets.dart';
import 'package:sportify/constants/responsiveConst.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

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
                  child: Image.asset('assets/bg.png', fit: BoxFit.fitWidth),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    width: width,
                    child: Image.asset('assets/sport.png'),
                  ),
                ),
              ],
            ),
            Spacing.verticalSpacing(20.0),
            Container(
              child: Column(
                children: [
                  Text(
                    "Welcome to sportify",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "Find what events happening around you",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Spacing.verticalSpacing(50.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 100,
                          child: OutlinedButton(
                            onPressed: () => Get.toNamed('/signup'),
                            child: Text("Sign Up"),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => Get.toNamed('/signin'),
                            child: Text("Log in"),
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacing.verticalSpacing(50.0),
            // here put something later
          ],
        ),
      ),
    );
  }
}
