import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    appBarTheme: lightAppBar,
    colorScheme: ColorScheme.light(
        inverseSurface: Color(0xFF1C1B1F), surface: Color(0xFFFFFFFF)));

AppBarTheme lightAppBar = AppBarTheme(
  iconTheme: lightIconTheme,
  titleTextStyle: TextStyle(color: Color(0xFF1C1B1F), fontSize: 20),
);

IconThemeData lightIconTheme = IconThemeData(color: Color(0xFF1C1B1F));
