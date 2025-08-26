import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.title, required this.onPressed , required this.width});

  final String title;
  final double width;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
