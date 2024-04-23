import 'package:flutter/material.dart';

AppBar categoryAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    actions: const [
      SizedBox(),
    ],
  );
}
