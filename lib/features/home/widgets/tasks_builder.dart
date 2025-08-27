import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';

class TasksBuilder extends StatelessWidget {
  const TasksBuilder({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primaryColor,
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
          Transform.rotate(
            angle: 3.14 / 2,
            child: Text(
              task.isCompleted ? 'Completed' : 'Todo',
              style: TextStyles.getBodyTextStyle(color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
