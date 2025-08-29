import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';

class AppThems {
  static get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyles.getTitleTextStyle(
        color: AppColors.primaryColor,
      ),
    ),
    fontFamily: 'poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.getSmallTextStyle(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );

  static get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.getTitleTextStyle(
        color: AppColors.primaryColor,
      ),
      foregroundColor: AppColors.primaryColor,
    ),
    fontFamily: 'poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.whiteColor,
    ),
    datePickerTheme: DatePickerThemeData(backgroundColor: AppColors.blackColor),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.blackColor,
      dialTextColor: AppColors.primaryColor,
      hourMinuteColor: AppColors.primaryColor,
      dayPeriodColor: AppColors.primaryColor,
      dialBackgroundColor: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.getSmallTextStyle(color: AppColors.greyColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}
