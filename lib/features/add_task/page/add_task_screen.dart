import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/add_task/widgets/time_field_selection.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  var startTimeController = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );
  var endTimeController = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );

  List<Color> Colors = [
    AppColors.primaryColor,
    AppColors.orangeColor,
    AppColors.redColor,
  ];

  int SelectedColor = 0;
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
          title: 'Create Task',
          onPressed: () {},
          width: double.infinity,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'title',
              style: TextStyles.getBodyTextStyle(color: AppColors.primaryColor),
            ),
            Gap(6),

            TextFormField(
              decoration: InputDecoration(hint: Text('Enter Title')),
            ),
            Gap(12),
            Text(
              'Description',
              style: TextStyles.getBodyTextStyle(color: AppColors.primaryColor),
            ),
            Gap(6),

            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(hint: Text('Enter Description...')),
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
          children: List.generate(Colors.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  SelectedColor = index;
                });
              },
              child: CircleAvatar(
                backgroundColor: Colors[index],
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
