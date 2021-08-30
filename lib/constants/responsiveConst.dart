import 'package:get/get.dart';

final double width = Get.context.mediaQuery.size.width;
final double height = Get.context.mediaQuery.size.height;
final bool isPhone = Get.context.isPhone;
final bool isDarkMode = Get.context.isDarkMode;
final double paddedWidth = (width * 0.80);
const double iconSize = 15;
const String literalNotFound =
    "No data found 😓 Try Searching for place name or Category eg: Cricket";
