import 'package:flutter/material.dart';

import '../../core/resources/screen_size.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: blue,
    colorScheme: ColorScheme.fromSwatch(
      // primarySwatch: Colors.teal, // Set the primary color to teal
      primarySwatch: Colors.teal, // Set the primary color to teal
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.teal, // Set the button color
      textTheme: ButtonTextTheme.primary, // Set text color based on the theme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Set button border radius
      ),
    ),
    dividerColor: Colors.grey[400],
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    appBarTheme: appBarTheme(),
    useMaterial3: true,
    textTheme: TextTheme(
      headlineMedium: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
      headlineLarge: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
      bodyLarge: const TextStyle(fontSize: 18, fontFamily: 'Poppins'),
      bodyMedium: TextStyle(
          fontSize: 14, color: Colors.grey[700], fontFamily: 'Poppins'),
      bodySmall: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    // backgroundColor: bggColor,
    // backgroundColor: Color.fromARGB(255, 32, 143, 159),
    backgroundColor: primaryColor,
    elevation: 0.2,
    centerTitle: true,
    iconTheme: const IconThemeData(
      // color: Color(0XFF8B8B8B),
      color: Colors.white,
    ),
    titleTextStyle: const TextStyle(
      // color: Color(0XFF8B8B8B),
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

EdgeInsets pagePadding() {
  return const EdgeInsets.symmetric(horizontal: 20, vertical: 25);
}

SizedBox spaceBetweenTopics() {
  return const SizedBox(
    height: 30,
  );
}

const bgColor = Color.fromARGB(255, 53, 66, 48);

const lightWhiteColor = Color.fromARGB(255, 250, 250, 250);

const containerInternalPadding = EdgeInsets.all(10);

const yellowBorderColor = Color.fromARGB(255, 249, 229, 156);
const yelloBgColor = Color.fromARGB(255, 254, 240, 188);

const double bodySizeFrac = 1.34;

const double customBodySize = 1.24;

Widget customBodySizeContainer(
    {required BuildContext context,
    required Widget child,
    Color bgColor = Colors.white}) {
  return Container(
    height: getDeviceSize(context: context).deviceHeight / customBodySize,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: child,
  );
}

const lightGrey = Color.fromARGB(255, 189, 189, 189);

//per project change

Color primaryColor = const Color.fromARGB(255, 53, 66, 48);
Color lightPrimaryColor = const Color.fromARGB(255, 242, 255, 241);
Color buttonColor = const Color.fromARGB(255, 107, 147, 104);
Color blue = const Color.fromARGB(255, 32, 40, 86);
Color orange = const Color.fromARGB(255, 249, 86, 70);
Color purple = const Color.fromARGB(255, 126, 99, 202);
Color cyan = const Color.fromARGB(255, 33, 236, 185);
