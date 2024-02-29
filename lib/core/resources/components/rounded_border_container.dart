import 'package:flutter/material.dart';

Widget roundedBorderContainer({
  Color bgColor = Colors.white,
  double borderRadius = 8,
  EdgeInsetsGeometry padding = const EdgeInsets.all(0),
  BoxBorder? border,
  double? height,
  double? width,
  
  required Widget child,
}) {
  return Container(
    height: height,
    width: width,
    padding: padding,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: border,
    ),
    child: child,
  );
}
