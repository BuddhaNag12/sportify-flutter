import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/colorConst.dart';
// Utility Methods

void showMessageDialog(String message) {
  Get.snackbar(
    'Info',
    '$message' '',
    colorText: Colors.white,
    barBlur: 1.5,
    icon: Icon(
      Icons.info_rounded,
      color: Colors.white,
    ),
    isDismissible: true,
    borderRadius: 8,
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.teal,
    duration: Duration(seconds: 2),
  );
}

/// For showing default dialog
/// Dialog Type [type] [DialogType type].
/// [message] type [String]
void showDefaultDialog(String message, DialogType type) {
  Get.defaultDialog(
    title: "Info",
    middleText: message,
    backgroundColor: getBackgorundColor(type),
    titleStyle: TextStyle(color: Colors.white),
    middleTextStyle: TextStyle(color: Colors.white),
    barrierDismissible: true,
    confirm: TextButton(
      onPressed: () => Get.back(),
      child: Text(
        "Ok",
        style: TextStyle(color: Colors.white),
      ),
    ),
    radius: 8,
  );
}

String checkIsValid(
    {String value, bool isDescription, String fieldName, bool isNum}) {
  if (isNum) {
    var msg;
    if (!GetUtils.isNum(value)) {
      msg = 'Enter valid $fieldName';
    } else {
      msg = null;
    }
    return msg;
  } else if (isDescription) {
    var msg;
    if (!GetUtils.isLengthBetween(value, 1, 150)) {
      msg = 'Enter valid $fieldName';
    } else {
      msg = null;
    }
    return msg;
  } else if (value == null || value.isEmpty) {
    return 'Please enter valid characters';
  } else {
    return null;
  }
}

Color getBackgorundColor(DialogType type) {
  switch (type) {
    case DialogType.success:
      return Colors.greenAccent;
      break;
    case DialogType.warning:
      return Colors.redAccent;
      break;
    default:
      return primaryColorDark;
  }
}

// utility
DateFormat dateFormat = DateFormat("yyyy-MM-dd");
DateFormat timeFormat = DateFormat("HH:mm");
