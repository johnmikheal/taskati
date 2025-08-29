import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/task_colors.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/add_task/page/add_task_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onComplete,
    required this.onDelete,
  });
  final TaskModel task;
  final Function() onComplete;
  final Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Dismissible(
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            onComplete();
          } else {
            onDelete();
          }
        },
        key: UniqueKey(),
        background: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.check, color: AppColors.whiteColor),
              Gap(10),

              Text('Complete', style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ),
        secondaryBackground: Container(
          padding: EdgeInsets.all(12),

          decoration: BoxDecoration(
            color: AppColors.redColor,

            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete, color: AppColors.whiteColor),
              Gap(10),
              Text('Delete', style: TextStyle(color: AppColors.whiteColor)),
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () {
            pushTo(context, AddEditTaskScreen(taskModel: task));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: task.isCompleted ? Colors.green : taskColors[task.color],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.getTitleTextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(4),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: AppColors.whiteColor,
                              size: 19,
                            ),
                            Gap(5),
                            Text(
                              '${task.startTime} - ${task.endTime}',
                              style: TextStyles.getSmallTextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Gap(4),
                        Text(
                          task.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.getBodyTextStyle(
                            fontWeight: FontWeight.w300,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(8),
                Container(width: 1, height: 70, color: AppColors.whiteColor),
                RotatedBox(
                  quarterTurns: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      task.isCompleted ? 'Completed' : 'Todo',
                      style: TextStyles.getSmallTextStyle(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
