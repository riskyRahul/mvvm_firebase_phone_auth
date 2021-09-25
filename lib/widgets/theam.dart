import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      fontFamily: 'oswald',
      primaryColor: Colors.black,
      canvasColor: Colors.white,
      primaryColorLight: Colors.black,
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
