import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
  // Utility Methods

  void showMessageDialog(msg) {
    Get.snackbar(
      'Info',
      '$msg',
      colorText: Colors.white,
      barBlur: 1.5,
      icon: Icon(
        Icons.info_rounded,
        color: Colors.white,
      ),
      isDismissible: true,
      shouldIconPulse: true,
      borderRadius: 8,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.teal,
      duration: Duration(seconds: 3),
    );
  }

    // utility
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateFormat timeFormat = DateFormat("HH:mm");