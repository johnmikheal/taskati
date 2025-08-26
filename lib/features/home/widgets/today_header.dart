import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/add_task/page/add_task_screen.dart';

class TodayHeader extends StatefulWidget {
  const TodayHeader({super.key});

  @override
  State<TodayHeader> createState() => _TodayHeaderState();
}

class _TodayHeaderState extends State<TodayHeader> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat("MMM d, yyyy").format(selectedDate),
                    style: TextStyles.getTitleTextStyle(),
                  ),

                  Text(
                    DateFormat.EEEE().format(selectedDate),
                    style: TextStyles.getBodyTextStyle(),
                  ),
                ],
              ),
            ),
            MainButton(
              width: 200,
              title: '+ Add Task',
              onPressed: () {
                pushTo(context, AddTaskScreen());
              },
            ),
          ],
        ),
        Gap(20),
        DatePicker(
          height: 100,
          width: 70,
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primaryColor,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
      ],
    );
  }
}
