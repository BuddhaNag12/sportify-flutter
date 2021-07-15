// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sportify/controllers/authController.dart';
// import 'package:sportify/controllers/eventController.dart';
// import 'package:sportify/routes/route_paths.dart';

// class Root extends GetWidget<AuthController> {
//   @override
//   Widget build(BuildContext context) {
//     return GetX(
//       initState: (_) async {
//         Get.put<EventController>(EventController());
//       },
//       builder: (_) {
//         if (Get.find<AuthController>().isLoggedIn.isTrue) {
//           return ViewEventScreen();
//         } else {
//           return HomeScreen();
//         }
//       },
//     );
//   }
// }
