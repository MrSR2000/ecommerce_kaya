import 'package:flutter/material.dart';

import '../../core/resources/screen_size.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: blue,
    colorScheme: lightColorScheme,
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

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: blue,
    colorScheme: darkColorScheme,
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

// const bgColor = Color.fromARGB(255, 53, 66, 48);

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

Color bgColor = const Color.fromARGB(255, 245, 245, 245);

//color scheme
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF306B25),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFB1F49D),
  onPrimaryContainer: Color(0xFF002200),
  secondary: Color(0xFF54634D),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD7E8CD),
  onSecondaryContainer: Color(0xFF121F0E),
  tertiary: Color(0xFF386568),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBCEBEE),
  onTertiaryContainer: Color(0xFF002022),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  surface: Color(0xFFFCFDF6),
  onSurface: Color(0xFF1A1C18),
  surfaceVariant: Color(0xFFDFE4D7),
  onSurfaceVariant: Color(0xFF43483F),
  outline: Color(0xFF73796E),
  onInverseSurface: Color(0xFFF1F1EB),
  inverseSurface: Color(0xFF2F312D),
  inversePrimary: Color(0xFF96D784),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF306B25),
  outlineVariant: Color(0xFFC3C8BC),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF96D784),
  onPrimary: Color(0xFF013A00),
  primaryContainer: Color(0xFF16520E),
  onPrimaryContainer: Color(0xFFB1F49D),
  secondary: Color(0xFFBBCBB2),
  onSecondary: Color(0xFF263422),
  secondaryContainer: Color(0xFF3C4B37),
  onSecondaryContainer: Color(0xFFD7E8CD),
  tertiary: Color(0xFFA0CFD2),
  onTertiary: Color(0xFF003739),
  tertiaryContainer: Color(0xFF1E4D50),
  onTertiaryContainer: Color(0xFFBCEBEE),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1A1C18),
  onBackground: Color(0xFFE2E3DC),
  surface: Color(0xFF1A1C18),
  onSurface: Color(0xFFE2E3DC),
  surfaceVariant: Color(0xFF43483F),
  onSurfaceVariant: Color(0xFFC3C8BC),
  outline: Color(0xFF8D9387),
  onInverseSurface: Color(0xFF1A1C18),
  inverseSurface: Color(0xFFE2E3DC),
  inversePrimary: Color(0xFF306B25),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF96D784),
  outlineVariant: Color(0xFF43483F),
  scrim: Color(0xFF000000),
);
