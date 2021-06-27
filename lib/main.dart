import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    return GetMaterialApp(
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: "Sportify",
      unknownRoute: GetPage(name: '/notfound', page: () => PageNotFound()),
      initialRoute: isSplash ? Routes.ROOT : Routes.SPLASH,
      getPages: AppPages.routes,
      // themeMode: ThemeMode.dark,
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
            fontFamily: 'russian',
            fontSize: 28,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        primaryColor: Colors.tealAccent.shade700,
        primarySwatch: Colors.teal,
      ),
    );
  }
}
