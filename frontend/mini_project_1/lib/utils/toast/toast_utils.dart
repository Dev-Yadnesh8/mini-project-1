import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast({
    required String message,
    ToastType toastType = ToastType.info,
    ToastGravity gravity = ToastGravity.BOTTOM,
    int durationInSeconds = 3,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: durationInSeconds,
      backgroundColor: _getBackgroundColor(toastType),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Color _getBackgroundColor(ToastType toastType) {
    switch (toastType) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.orange;
      case ToastType.info:
      default:
        return Colors.blue;
    }
  }
}

enum ToastType { success, error, warning, info }
