//common text style
import 'package:flutter/material.dart';

enum TextSize {
  small,
  medium,
  large,
  extraLarge,
}

Widget textWidget({
  required String text,
  required TextSize textSize,
  Color color = Colors.black,
  int? maxLine = 1,
  TextAlign textAlign = TextAlign.left,
  FontWeight fontWeight = FontWeight.normal,
  bool capital = false,
  TextDecoration? textDecoration,
}) {
  return Text(
    capital ? text.toUpperCase() : text,
    softWrap: true,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
    textAlign: textAlign,
    style: TextStyle(
      decoration: textDecoration,
      fontFamily: "Poppins",
      fontSize: textSize == TextSize.extraLarge
          ? 22
          : textSize == TextSize.large
              ? 18
              : textSize == TextSize.medium
                  ? 15
                  : 13,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

TextStyle mediumTextStyle = const TextStyle(fontSize: 15);
