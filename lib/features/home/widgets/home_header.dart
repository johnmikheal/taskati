import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/profile/profile_screen.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello , ${(LocalHelper.getData(LocalHelper.kName) as String).split(' ').first}',
                style: TextStyles.getTitleTextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
              Text('Have a nice day', style: TextStyles.getBodyTextStyle()),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            pushTo(context, ProfileScreen()).then((value) {
              setState(() {});
            });
          },
          child: CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.primaryColor,

            child: CircleAvatar(
              radius: 22,
              backgroundImage: LocalHelper.getData(LocalHelper.kImage) != null
                  ? FileImage(File(LocalHelper.getData(LocalHelper.kImage)))
                  : AssetImage(AppImages.user),
            ),
          ),
        ),
      ],
    );
  }
}
