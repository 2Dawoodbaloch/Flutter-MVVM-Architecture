import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';


final lightTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.onPrimary,
      onSecondary: AppColors.onPrimary,
      error: AppColors.onPrimary,
      onError: AppColors.onPrimary,
      surface: AppColors.onPrimary,
      onSurface: AppColors.onPrimary
  ),
);