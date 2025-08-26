import 'package:hive/hive.dart';

class LocalHelper {
  static late Box userBox;
  static String kName = 'user';
  static String kImage = 'image';
  static String kIsUpload = 'isUpload';


  static init() async {
    await Hive.openBox(kName);
    userBox = Hive.box(kName);
    await Hive.openBox(kImage);
    userBox = Hive.box(kImage);
  }

  static cachData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }
}
