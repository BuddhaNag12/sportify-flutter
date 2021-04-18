import 'package:get/get.dart';
import 'package:sportify/screens/authStack/SignUpScreen.dart';
import 'package:sportify/screens/eventsStack/createEventScreen.dart';
import 'package:sportify/screens/eventsStack/viewEventScreen.dart';
import 'package:sportify/screens/homeScreen.dart';
import 'package:sportify/screens/authStack/LoginScreen.dart';
part 'app_routes.dart';


class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      // binding: RootScreenBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpScreen(),
      // binding: RootScreenBinding(),
    ),
    GetPage(
      name: Routes.VIEW_EVENTS,
      page: () => ViewEventScreen(),
      // binding: RootScreenBinding(),
    ),
    GetPage(
      name: Routes.CREATE_EVENTS,
      page: () => CreateEventsScreen(),
      // binding: RootScreenBinding(),
    ),
  ];
}
