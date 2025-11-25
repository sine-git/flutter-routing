import 'package:flutter/material.dart';
import 'package:routing/themes/dark-mode.dart';
import 'package:routing/themes/light-mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = lightMode;

  get theme => _theme;
  set theme(theme) => _theme = theme;

  switchTheme() {
    theme = (theme == lightMode) ? darkMode : lightMode;
    notifyListeners();
  }

  isDarkMode() => theme == darkMode;
}
