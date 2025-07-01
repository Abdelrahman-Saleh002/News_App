import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.blackColor),
          backgroundColor: AppColors.whiteColor, centerTitle: true),
      textTheme: TextTheme(
          labelLarge: AppStyles.medium24Black,
          headlineLarge: AppStyles.bold16Black,
          headlineMedium: AppStyles.medium14Black));

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
      indicatorColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.blackColor,
      ),
      textTheme: TextTheme(
          labelLarge: AppStyles.medium24White,
          headlineLarge: AppStyles.bold16White,
          headlineMedium: AppStyles.medium14White));
}
