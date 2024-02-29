import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Padding bodyPadding({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: child,
  );
}
