import 'package:flutter/material.dart';

class GetDeviceSize {
  final double deviceHeight;
  final double deviceWidth;

  GetDeviceSize({
    required this.deviceHeight,
    required this.deviceWidth,
  });
}

GetDeviceSize getDeviceSize({required BuildContext context}) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;

  return GetDeviceSize(deviceHeight: deviceHeight, deviceWidth: deviceWidth);
}
