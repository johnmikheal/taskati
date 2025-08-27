import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/tasks_builder.dart';
import 'package:taskati/features/home/widgets/today_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              HomeHeader(),
              Gap(16),
              TodayHeader(),
              Gap(20),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: LocalHelper.taskBox.listenable(),
                  builder: (context, box, child) {
                    List<TaskModel> tasks = box.values.toList();
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return TasksBuilder(task: tasks[index]);
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
        ),
      ),
    );
  }
}
