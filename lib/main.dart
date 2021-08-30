import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportify/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:sportify/screens/routNotFound.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splash = GetStorage();
    bool isSplash = splash.read('isSplash') ?? false;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    return GetMaterialApp(
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: "Sportify",
      unknownRoute: GetPage(name: '/notfound', page: () => PageNotFound()),
      initialRoute: isSplash ? Routes.HOME : Routes.SPLASH,
      getPages: AppPages.routes,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Hammer',
            fontSize: 20,
          ),
          headline2: TextStyle(
            fontFamily: 'Hammer',
            fontSize: 16,
          ),
          caption: TextStyle(
            fontFamily: 'Hammer',
            fontSize: 13,
            fontWeight: FontWeight.normal
          ),
          headline3: TextStyle(
            fontFamily: 'russian',
          ),
          subtitle1: TextStyle(
            fontFamily: 'Hammer',
            fontSize: 17,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        primaryColor: Colors.tealAccent.shade700,
        primarySwatch: Colors.teal,
      ),
    );
  }
}
