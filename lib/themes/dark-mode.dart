import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    appBarTheme: darkAppBar,
    colorScheme: ColorScheme.light(
        inverseSurface: Color(0xFFFFFFFF), surface: Color(0xFF1C1B1F)));

AppBarTheme darkAppBar = AppBarTheme(
  iconTheme: darkIconTheme,
  titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
);

IconThemeData darkIconTheme = IconThemeData(color: Color(0xFFFFFFFF));
