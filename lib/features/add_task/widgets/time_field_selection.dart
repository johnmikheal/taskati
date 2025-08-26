import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';

class TimeFieldSelection extends StatelessWidget {
  const TimeFieldSelection({
    super.key,
    required this.controller,
    required this.text,
    required this.onTap,
  });

  final TextEditingController controller;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            text,
            style: TextStyles.getBodyTextStyle(color: AppColors.primaryColor),
          ),
          Gap(6),

          TextFormField(
            controller: controller,
            onTap: onTap,
            readOnly: true,
            style: TextStyles.getBodyTextStyle(),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.watch_later_outlined,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
