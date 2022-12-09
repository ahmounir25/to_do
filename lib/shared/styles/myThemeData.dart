import 'package:flutter/material.dart';

import 'colors.dart';

class myThemeData {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: goldColor,
          onPrimary: blackColor,
          secondary: Colors.brown,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.transparent,
          onBackground: blackColor,
          surface: Colors.white,
          onSurface: goldColor),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: blackColor, fontSize: 30, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 20, color: blackColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: goldColor,
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: onPrimaryDarkcolor,
          onPrimary: primaryDarkcolor,
          secondary: primaryDarkcolor,
          onSecondary: onPrimaryDarkcolor,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.transparent,
          onBackground: onPrimaryDarkcolor,
          surface: primaryDarkcolor,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 20, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryDarkcolor,
        selectedItemColor: onPrimaryDarkcolor,
        unselectedItemColor: Colors.white,
      ));
}
