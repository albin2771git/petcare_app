import 'package:flutter/material.dart';
import 'package:petcare_app/src/features/theme/presentation/theme_pref.dart';

class ThemeProvider with ChangeNotifier {
  ThemePrefs themePref = ThemePrefs();

  // bool _darkTheme = false;

  // bool get darkTheme => _darkTheme;

  // /// create setter for darkTheme
  // set setterDarkTheme(bool value) {
  //   _darkTheme = value;
  //   setDarkTheme(value);
  // }

  // setDarkTheme(bool value) {
  //   themePref.setDarkTheme(value);
  //   notifyListeners();
  // }
  bool isDarkTheme = false;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
