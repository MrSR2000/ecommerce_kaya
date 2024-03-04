import 'package:flutter/material.dart';
import 'package:kaya/core/resources/components/gaps.dart';

import '../../../../core/resources/components/elevated_button_style.dart';
import '../../../../core/resources/components/text_widget.dart';

Center ifNotLoggedInBody(BuildContext context, dynamic onPressed) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        textWidget(
          text: "Please Login First",
          textSize: TextSize.medium,
        ),
        gap10,
        ElevatedButton(
          style: elevatedButtonStyle,
          onPressed: onPressed,
          child: textWidget(
            text: "Login",
            textSize: TextSize.medium,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

InkWell optionsWidget({required String title, required dynamic ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      color: Colors.white,
      child: Row(
        children: [
          textWidget(
            text: title,
            textSize: TextSize.medium,
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    ),
  );
}
