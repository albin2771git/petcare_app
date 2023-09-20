import 'package:flutter/material.dart';
import 'package:petcare_app/src/features/theme/presentation/theme_pref.dart';



class ThemeProvider with ChangeNotifier {

ThemePrefs themePref = ThemePrefs();


bool _darkTheme = false;


bool get darkTheme => _darkTheme;


set setDarkTheme(bool value) {
  _darkTheme = value;
  
  themePref.setDarkTheme(value);

  notifyListeners();
}


 
}
