import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/add_task/page/add_task_screen.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: TextStyles.getTitleTextStyle(),
              ),

              Text(
                DateFormat.EEEE().format(DateTime.now()),
                style: TextStyles.getBodyTextStyle(),
              ),
            ],
          ),
        ),
        MainButton(
          width: 200,
          title: '+ Add Task',
          onPressed: () {
            pushTo(context, AddEditTaskScreen());
          },
        ),
      ],
    );
  }
}
