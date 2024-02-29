//elevated button style
import 'package:flutter/material.dart';

import '../../../config/theme/app_themes.dart';

ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: buttonColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
