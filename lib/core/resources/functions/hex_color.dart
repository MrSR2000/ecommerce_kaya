  import 'package:flutter/material.dart';

Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    int intValue = int.parse(hexColor, radix: 16);
    return Color(intValue | 0xFF000000);
  }