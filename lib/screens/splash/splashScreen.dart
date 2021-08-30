import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import 'package:sportify/widgets/localWidgets.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SplashScreen extends StatelessWidget {
  void askPermission() async {
    try {
      await Permission.locationWhenInUse.request();
      await Permission.storage.request();
    } catch (e) {
      final String err = e.toString();
      showMessageDialog(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    askPermission();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    final PageController controller = PageController(initialPage: 0);

    _nextPage(int index) {
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          Container(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: MediaQuery.of(context).size.width / 2,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  Container(
                    child: Image.asset(
                      'assets/sp1.png',
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),
                  Spacing.verticalSpacing(20.0),
                  Text(
                    "Welcome to sportify",
                    style: headline1,
                  ),
                  Spacing.verticalSpacing(10.0),
                  Text(
                    "Here You can find latest Sports event around you",
                    style: captionDark,
                  ),
                  Text(
                    "Swipe Right or click next to know more",
                    style: captionDark,
                  ),
                  Spacing.verticalSpacing(50.0),
                  ElevatedButton.icon(
                    onPressed: () => _nextPage(1),
                    icon: Icon(FlutterIcons.navigate_next_mdi),
                    label: Text("Next"),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: MediaQuery.of(context).size.width / 2,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  Container(
                    child: Image.asset(
                      'assets/sp2.png',
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),
                  Spacing.verticalSpacing(20.0),
                  Text(
                    "You can join sports event ",
                    style: headline1,
                  ),
                  Spacing.verticalSpacing(20.0),
                  Text(
                    "Or even you can create your own events ",
                    style: captionDark,
                  ),
                  Text(
                    "It's all upto you ",
                    style: captionDark,
                  ),
                  Spacing.verticalSpacing(50.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      final splash = GetStorage();
                      splash.write('isSplash', true);
                      Get.offAndToNamed('/home');
                    },
                    icon: Icon(Icons.arrow_upward_rounded),
                    label: Text("Get Started"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
