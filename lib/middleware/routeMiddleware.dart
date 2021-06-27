import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportify/controllers/authController.dart';

class RouteMiddleWare extends GetMiddleware {
  RouteSettings redirect(String route) {
    print("rout called $route");
    final authService = Get.find<AuthController>();
    return authService.isLoggedIn.isTrue
        ? null
        : RouteSettings(name: '/signin', arguments: "You Need to Login First");
  }
}
