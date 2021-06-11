import 'package:get/get.dart';

final double width = Get.context.mediaQuery.size.width;
final double height = Get.context.mediaQuery.size.height;
final bool isPhone = Get.context.isPhone;
final bool isDarkMode = Get.context.isDarkMode;
final double paddedWidth = (width*0.90);