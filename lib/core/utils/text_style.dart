import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';

class TextStyles {
  static TextStyle getTitleTextStyle({
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold,
    Color color = AppColors.blackColor,
  }) {
    return TextStyle(
      fontFamily: 'poppins',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle getBodyTextStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color color = AppColors.blackColor,
  }) {
    return TextStyle(
      fontFamily: 'poppins',

      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle getSmallTextStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.bold,
    Color color = AppColors.greyColor,
  }) {
    return TextStyle(
      fontFamily: 'poppins',

      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
