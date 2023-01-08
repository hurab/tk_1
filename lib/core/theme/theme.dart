import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData get appTheme {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColorDark,
      primaryColorLight: AppColors.primaryColorLight,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColorDark,
        secondary: AppColors.accentColor,
        onSecondary: AppColors.accentColorDark,
        error: Colors.redAccent,
        onError: Colors.red,
        background: Colors.white,
        onBackground: Colors.grey,
        surface: Colors.white,
        onSurface: Colors.grey,
      ));
}
