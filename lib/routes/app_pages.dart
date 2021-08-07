import 'package:sportify/screens/categoryView.dart';
import 'package:sportify/screens/eventsStack/favoritesEvents.dart';
import 'package:sportify/screens/eventsStack/my_events.dart';

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
  ];
}
