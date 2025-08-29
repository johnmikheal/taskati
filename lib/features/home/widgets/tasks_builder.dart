import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/home/widgets/task_card.dart';

class TasksBuilder extends StatefulWidget {
  const TasksBuilder({super.key});

  @override
  State<TasksBuilder> createState() => _TasksBuilderState();
}

class _TasksBuilderState extends State<TasksBuilder> {
  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DatePicker(
            height: 100,
            width: 70,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.primaryColor,
            selectedTextColor: Colors.white,
            dayTextStyle: TextStyles.getBodyTextStyle(),
            monthTextStyle: TextStyles.getBodyTextStyle(),
            dateTextStyle: TextStyles.getBodyTextStyle(),
            onDateChange: (date) {
              setState(() {
                selectedDate = DateFormat('yyyy-MM-dd').format(date);
              });
            },
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: LocalHelper.taskBox.listenable(),
              builder: (context, box, child) {
                List<TaskModel> tasks = [];
                for (var model in box.values) {
                  if (model.date == selectedDate) {
                    tasks.add(model);
                  }
                }
                if (tasks.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/images/embty task.json',
                          width: 400,
                        ),
                        Text(
                          'No Task Found',
                          style: TextStyles.getBodyTextStyle(),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: tasks[index],
                      onComplete: () {
                        box.put(
                          tasks[index].id,
                          tasks[index].copyWith(isCompleted: true),
                        );
                      },
                      onDelete: () {
                        box.delete(tasks[index].id);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Gap(10);
                  },
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
