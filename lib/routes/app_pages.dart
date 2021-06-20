import 'package:get/get.dart';
import 'package:sportify/bindings/gMap_Binding.dart';
import 'package:sportify/bindings/signUpBinding.dart';
import 'package:sportify/bindings/signinBinding.dart';
import 'package:sportify/screens/authStack/SignUpScreen.dart';
import 'package:sportify/screens/eventsStack/JoinEventsScreen.dart';
import 'package:sportify/screens/eventsStack/createEventScreen.dart';
import 'package:sportify/screens/eventsStack/viewEventScreen.dart';
import 'package:sportify/screens/eventsStack/viewEventsScreen.dart';
import 'package:sportify/screens/homeScreen.dart';
import 'package:sportify/screens/authStack/LoginScreen.dart';
import 'package:sportify/screens/profileStack/accountScreen.dart';
import 'package:sportify/screens/profileStack/profileScreen.dart';
import 'package:sportify/screens/splashScreen.dart';
// bindings
import 'package:sportify/bindings/auth_binding.dart';
import 'package:sportify/bindings/event_binding.dart';
import 'package:sportify/bindings/profile_binding.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ACCOUNT,
      page: () => MyAccount(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: AuthBindings(),
      // middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: SigninBinding(),
      // middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.VIEW_EVENTS,
      page: () => ViewEventsScreenTab(),
      bindings: [
        EventBinding(),
        AuthBindings(),
      ],
    ),
    GetPage(
      name: Routes.CREATE_EVENTS,
      page: () => CreateEventsScreen(),
      bindings: [
        EventBinding(),
        AuthBindings(),
      ],
    ),
    GetPage(
      name: Routes.VIEW_EVENT,
      page: () => ViewEventScreen(),
      bindings: [
        EventBinding(),
        ViewEventBinding(),
        AuthBindings(),
      ],
    ),
    GetPage(
      name: Routes.JOIN_EVENTS,
      page: () => JoinEventsScreen(),
      bindings: [
        EventBinding(),
        AuthBindings(),
      ],
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
      bindings: [AuthBindings(), ProfileBinding()],
    ),
  ];
}
