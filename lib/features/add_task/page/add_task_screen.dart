import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/task_colors.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/add_task/widgets/time_field_selection.dart';

class AddEditTaskScreen extends StatefulWidget {
  const AddEditTaskScreen({super.key, this.taskModel});
  final TaskModel? taskModel;
  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController(
    // text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  var startTimeController = TextEditingController(
    // text: DateFormat('hh:mm a').format(DateTime.now()),
  );
  var endTimeController = TextEditingController(
    // text: DateFormat('hh:mm a').format(DateTime.now()),
  );

  var formKey = GlobalKey<FormState>();

  int SelectedColor = 0;
  @override
  void initState() {
    super.initState();
    titleController.text = widget.taskModel?.title ?? '';
    descriptionController.text = widget.taskModel?.description ?? '';
    dateController.text =
        widget.taskModel?.date ??
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    startTimeController.text =
        widget.taskModel?.startTime ??
        DateFormat('hh:mm a').format(DateTime.now());
    endTimeController.text =
        widget.taskModel?.endTime ??
        DateFormat('hh:mm a').format(DateTime.now());
    SelectedColor = widget.taskModel?.color ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              'Add Task',
              style: TextStyles.getBodyTextStyle(color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: MainButton(
          title: widget.taskModel != null ? 'Update Task' : 'Create Task',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              String id = '';
              if (widget.taskModel != null) {
                id = widget.taskModel!.id;
              } else {
                id = DateTime.now().millisecondsSinceEpoch.toString();
              }
              // var id = DateTime.now().microsecondsSinceEpoch.toString();
              LocalHelper.cachTask(
                id,
                TaskModel(
                  id: id,
                  title: titleController.text,
                  description: descriptionController.text,
                  date: dateController.text,
                  startTime: startTimeController.text,
                  endTime: endTimeController.text,
                  color: SelectedColor,
                  isCompleted: false,
                ),
              );
              Navigator.pop(context);
            }
          },
          width: double.infinity,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'title',
                style: TextStyles.getBodyTextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
              Gap(6),

              TextFormField(
                controller: titleController,

                decoration: InputDecoration(hint: Text('Enter Title')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter title';
                  }
                  return null;
                },
              ),
              Gap(12),
              Text(
                'Description',
                style: TextStyles.getBodyTextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
              Gap(6),

              TextFormField(
                controller: descriptionController,

                maxLines: 3,
                decoration: InputDecoration(hint: Text('Enter Description...')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter decoration';
                  }
                  return null;
                },
              ),
              Gap(12),
              dateSelection(),
              Gap(12),
              timeSelection(),
              Gap(20),
              colorSelection(),
            ],
          ),
        ),
      ),
    );
  }

  Column colorSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyles.getBodyTextStyle(color: AppColors.primaryColor),
        ),
        Gap(6),
        Row(
          spacing: 6,
          children: List.generate(taskColors.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  SelectedColor = index;
                });
              },
              child: CircleAvatar(
                backgroundColor: taskColors[index],
                child: SelectedColor == index
                    ? Icon(Icons.check, color: AppColors.whiteColor)
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }

  Column dateSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: TextStyles.getBodyTextStyle(color: AppColors.primaryColor),
        ),
        Gap(6),

        TextFormField(
          controller: dateController,
          onTap: () async {
            var SelectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365 * 3)),
            );
            if (SelectedDate != null) {
              dateController.text = DateFormat(
                'yyyy-MM-dd',
              ).format(SelectedDate);
            }
          },
          readOnly: true,
          style: TextStyles.getBodyTextStyle(),
          decoration: InputDecoration(),
        ),
      ],
    );
  }

  Row timeSelection() {
    return Row(
      children: [
        TimeFieldSelection(
          controller: startTimeController,
          text: 'Start Time',
          onTap: () async {
            var SelectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (SelectedTime != null) {
              startTimeController.text = SelectedTime.format(context);
            }
          },
        ),

        Gap(8),
        TimeFieldSelection(
          controller: endTimeController,
          text: 'End Time',
          onTap: () async {
            var SelectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (SelectedTime != null) {
              endTimeController.text = SelectedTime.format(context);
            }
          },
        ),
      ],
    );
  }
}
