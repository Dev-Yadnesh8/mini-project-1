import 'package:flutter/material.dart';

class MHelper{

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

}