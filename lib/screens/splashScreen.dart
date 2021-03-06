import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportify/widgets/localWidgets.dart';
import 'package:sportify/constants/responsiveConst.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    final PageController controller = PageController(initialPage: 0);

    _nextPage(int index) {
      print("clicked");
      controller.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
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
              children: [
                Container(
                  child: Image.asset(
                    'assets/sp1.png',
                    fit: BoxFit.cover,
                    width: width,
                  ),
                ),
                spacer(20.0),
                Text(
                  "Welcome to sportify",
                  style: Theme.of(context).textTheme.headline1,
                ),
                spacer(10.0),
                Text(
                  "Here You can find latest Sports event around you",
                  style: Theme.of(context).textTheme.headline2,
                ),
                spacer(10.0),
                spacer(20.0),
                Text(
                  "Swipe Right or click next to know more",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                spacer(50.0),
                ElevatedButton.icon(
                  onPressed: () => _nextPage(1),
                  icon: Icon(Icons.arrow_right_rounded),
                  label: Text("Next"),
                )
              ],
            ),
          ),
          Container(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/sp2.png',
                    fit: BoxFit.cover,
                    width: width,
                  ),
                ),
                spacer(20.0),
                Text(
                  "You can join sports event ",
                  style: Theme.of(context).textTheme.headline1,
                ),
                spacer(20.0),
                Text(
                  "Or even you can create your own events ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "It's all upto you ",
                  style: Theme.of(context).textTheme.headline2,
                ),
                spacer(10.0),
                Text(
                  "Get started ????",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                spacer(50.0),
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
        ],
      ),
    );
  }
}
