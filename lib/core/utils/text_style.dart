import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';

class TextStyles {
  static TextStyle getTitleTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'poppins',
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color,
    );
  }

  static TextStyle getBodyTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'poppins',
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.bold,
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
