import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sportify/routes/app_pages.dart';
import 'package:get/get.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      // locale: Get.deviceLocale,
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: "Sportify",
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.normal,
          ),
          caption: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          headline3: TextStyle(
              fontFamily: 'russian', fontSize: 28, color: Colors.white),
        ),
        primaryColor: Colors.tealAccent.shade700,
        primarySwatch: Colors.teal,
      ),
    ),
  );
}
