import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sportify/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('pt', ''),
        Locale('tr', ''),
        Locale('es', ''),
        Locale('it', ''),
        Locale('ru', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: "Sportify",
      initialRoute: Routes.HOME,
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
            fontFamily: 'russian',
            fontSize: 28,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Colors.white
          )
        ),
        primaryColor: Colors.tealAccent.shade700,
        primarySwatch: Colors.teal,
      ),
    );
  }
}
