import 'package:flutter/material.dart';

pushPage({required BuildContext context, required page}) {
  Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

pushReplacePage({required BuildContext context, required page}) {
  Navigator.of(context).popUntil((route) => route.isFirst);
  Navigator.of(context, rootNavigator: true).pushReplacement(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}
