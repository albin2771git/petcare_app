import 'package:cuddlecare/src/core/app_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData edisappParentTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    disabledColor: AppColors.greyColor,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.blueLightColor),
    textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(textStyle: const TextStyle()),
        displayMedium: GoogleFonts.poppins(textStyle: const TextStyle()),
        displaySmall: GoogleFonts.poppins(textStyle: const TextStyle()),
        headlineMedium: GoogleFonts.poppins(textStyle: const TextStyle()),
        headlineSmall: GoogleFonts.poppins(textStyle: const TextStyle()),
        titleLarge: GoogleFonts.poppins(textStyle: const TextStyle()),
        titleMedium: GoogleFonts.poppins(textStyle: const TextStyle()),
        bodyLarge: GoogleFonts.poppins(textStyle: const TextStyle()),
        titleSmall: GoogleFonts.playfairDisplay(textStyle: const TextStyle()),
        bodyMedium: GoogleFonts.poppins(textStyle: const TextStyle())),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.yellowColoryColor)
        .copyWith(background: AppColors.softBlueColor));
