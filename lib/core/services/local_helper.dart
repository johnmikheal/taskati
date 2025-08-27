// import 'package:hive/hive.dart';
// import 'package:taskati/core/models/task_model.dart';

// class LocalHelper {
//   static late Box userBox;
//   static late Box<TaskModel> taskBox;

//   static String kName = 'user';
//   static String kImage = 'image';
//   static String kIsUpload = 'isUpload';
//   static String kTaskBox = 'task';

//   static init() async {
//     await Hive.openBox(kName);
//     userBox = Hive.box(kName);

//     await Hive.openBox(kImage);
//     userBox = Hive.box(kImage);

//     await Hive.openBox<TaskModel>(kTaskBox);
//     Hive.registerAdapter<TaskModel>(TaskModelAdapter());
//     taskBox = Hive.box(kTaskBox);
//   }

//   static cachData(String key, dynamic value) {
//     userBox.put(key, value);
//   }

//   static getData(String key) {
//     return userBox.get(key);
//   }

//   static cachTask(String key, TaskModel task) {
//     taskBox.put(key, task);
//   }

//   static getTask(String key) {
//     return taskBox.get(key);
//   }
// }

import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/models/task_model.dart';

class LocalHelper {
  static late Box userBox;
  static late Box<TaskModel> taskBox;

  // static Box<TaskModel> get taskBox => _taskBox;

  // static Box get userBox => _userBox;

  static String kUserBox = 'user';
  static String kTaskBox = 'task';

  static String kName = 'name';
  static String kImage = 'image';
  static String kIsUpload = 'isUpload';
  static String kIsDark = 'isDark';

  static init() async {
    Hive.registerAdapter<TaskModel>(TaskModelAdapter());
    await Hive.openBox(kUserBox);
    await Hive.openBox<TaskModel>(kTaskBox);
    userBox = Hive.box(kUserBox);
    taskBox = Hive.box<TaskModel>(kTaskBox);

  }



  static cachData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  static cachTask(String key, TaskModel task) {
    taskBox.put(key, task);
  }

  static getTask(String key) {
    return taskBox.get(key);
  }
}
