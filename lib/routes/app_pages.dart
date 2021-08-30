import 'package:sportify/screens/aboutScreen.dart';
import 'package:sportify/screens/categoryView.dart';
import 'package:sportify/screens/eventsStack/edit_event.dart';
import 'package:sportify/screens/eventsStack/favoritesEvents.dart';
import 'package:sportify/screens/eventsStack/manage_events.dart';
import 'package:sportify/screens/eventsStack/my_events.dart';
import 'package:sportify/screens/notificationScreen.dart';
import 'package:sportify/screens/privacyScreen.dart';
import 'package:sportify/screens/supportScreen.dart';
import 'package:sportify/screens/termsScreen.dart';

import './route_paths.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ACCOUNT,
      page: () => MyAccount(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.CATVIEW,
      page: () => CatViewScreen(),
    ),
    GetPage(
      name: Routes.CATEGORIES,
      page: () => CategoriesScreen(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreenTab(),
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
      middlewares: [RouteMiddleWare()],
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
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_EVENTS,
      page: () => MyEventScreen(),
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.FABORITE,
      page: () => FavoriteEvents(),
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.MANAGE,
      page: () => ManageEvents(),
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.EDIT,
      page: () => EditEvent(),
      fullscreenDialog: true,
      opaque: true,
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationScreen(),
      opaque: true,
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => AboutScreen(),
      opaque: true,
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.TERMS,
      page: () => TermsScreen(),
      opaque: true,
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.PRIVACY,
      page: () => PrivacyScreen(),
      opaque: true,
      middlewares: [RouteMiddleWare()],
    ),
    GetPage(
      name: Routes.SUPPORT,
      page: () => SupportScreen(),
      opaque: true,
      middlewares: [RouteMiddleWare()],
    ),
  ];
}
