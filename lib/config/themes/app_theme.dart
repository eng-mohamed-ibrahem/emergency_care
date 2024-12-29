import 'package:emergeny_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const String defaultFontFamily = 'Mulish';
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: defaultFontFamily,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
  );
}
