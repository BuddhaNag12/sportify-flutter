import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sportify/global_widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        isTransparent: true,
      ),
      body: Container(
        // padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    'assets/background.svg',
                    fit: BoxFit.fill,
                    // height: 110,
                    // width: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/sport.png')),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                child: Column(
                  children: [
                    Text("Welcome to sportify",
                        style: Theme.of(context).textTheme.headline1),
                    Text(
                      "Find what events happening around you",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
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
                            onPressed: () => Get.toNamed('/view'),
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Not Logged In?"),
                  TextButton(
                    onPressed: () => Get.toNamed('/signin'),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
