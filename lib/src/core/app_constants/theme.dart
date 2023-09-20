import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

// ThemeData edisappParentTheme = ThemeData(
//     primaryColor: AppColors.primaryColor,
//     disabledColor: AppColors.greyColor,
//     textSelectionTheme:
//         const TextSelectionThemeData(cursorColor: AppColors.blueLightColor),
//     textTheme: TextTheme(
//         displayLarge: GoogleFonts.poppins(textStyle: const TextStyle()),
//         displayMedium: GoogleFonts.poppins(textStyle: const TextStyle()),
//         displaySmall: GoogleFonts.poppins(textStyle: const TextStyle()),
//         headlineMedium: GoogleFonts.poppins(textStyle: const TextStyle()),
//         headlineSmall: GoogleFonts.poppins(textStyle: const TextStyle()),
//         titleLarge: GoogleFonts.poppins(textStyle: const TextStyle()),
//         titleMedium: GoogleFonts.poppins(textStyle: const TextStyle()),
//         bodyLarge: GoogleFonts.poppins(textStyle: const TextStyle()),
//         titleSmall: GoogleFonts.playfairDisplay(textStyle: const TextStyle()),
//         bodyMedium: GoogleFonts.poppins(textStyle: const TextStyle())),
//     colorScheme: ColorScheme.fromSwatch()
//         .copyWith(secondary: AppColors.yellowColoryColor)
//         .copyWith(background: AppColors.softBlueColor));

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      appBarTheme: isDarkTheme
          ? const AppBarTheme(backgroundColor: AppColors.darkTheme)
          : const AppBarTheme(backgroundColor: AppColors.white),
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
