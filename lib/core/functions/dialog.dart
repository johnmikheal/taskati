import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';

showErrorDialog(BuildContext context , String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.redColor,
    ),
  );
}
