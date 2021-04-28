import 'package:get/get.dart';
import 'package:sportify/screens/authStack/SignUpScreen.dart';
import 'package:sportify/screens/eventsStack/JoinEventsScreen.dart';
import 'package:sportify/screens/eventsStack/createEventScreen.dart';
import 'package:sportify/screens/eventsStack/viewEventScreen.dart';
import 'package:sportify/screens/eventsStack/viewEventsScreen.dart';
import 'package:sportify/screens/homeScreen.dart';
import 'package:sportify/screens/authStack/LoginScreen.dart';
import 'package:sportify/screens/profileStack/profileScreen.dart';
import 'package:sportify/screens/splashScreen.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;
  // static const PROFILE = Routes.PROFILE;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.VIEW_EVENTS,
      page: () => ViewEventsScreen(),
    ),
    GetPage(
      name: Routes.CREATE_EVENTS,
      page: () => CreateEventsScreen(),
    ),
    GetPage(
      name: Routes.VIEW_EVENT,
      page: () => ViewEventScreen(),
    ),
    GetPage(
      name: Routes.JOIN_EVENTS,
      page: () => JoinEventsScreen(),
    ),
    GetPage(
      name: INITIAL,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
    ),
  ];
}
