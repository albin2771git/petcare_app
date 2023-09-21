import 'package:flutter/material.dart';
import 'app_colors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      appBarTheme: isDarkTheme
          ? const AppBarTheme(
              backgroundColor: AppColors.darkTheme,
              foregroundColor: AppColors.white,
              titleTextStyle: TextStyle(
                color: AppColors.white,
              ))
          : const AppBarTheme(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.black,
              titleTextStyle: TextStyle(color: AppColors.black)),
      scaffoldBackgroundColor: isDarkTheme ? AppColors.darkTheme : Colors.white,
      primaryColor: AppColors.primary2,
      colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: isDarkTheme ? AppColors.darkTheme : AppColors.white,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor: isDarkTheme ? AppColors.darkTheme : Colors.white,
      canvasColor: isDarkTheme ? AppColors.darkTheme : Colors.white,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
      textTheme: isDarkTheme
          ? Theme.of(context).textTheme.apply(
                bodyColor: AppColors.white,
                displayColor: AppColors.white,
                fontFamily: 'Poppins',
              )
          : Theme.of(context).textTheme.apply(
                bodyColor: AppColors.black,
                displayColor: AppColors.black,
                fontFamily: 'Poppins',
              ),
      iconTheme: isDarkTheme
          ? const IconThemeData(color: AppColors.white)
          : const IconThemeData(color: AppColors.black),
      useMaterial3: true,
    );
  }
}

//-------------------------------------------
final lightTheme =
    ThemeData(primarySwatch: Colors.green, brightness: Brightness.light);

final darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
);
