import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/thems.dart';
import 'package:taskati/features/intro/splash_screen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized(); //

  await Hive.initFlutter();

  // await Hive.deleteBoxFromDisk('task'); //

  await LocalHelper.init();
  runApp(const Taskati());
}

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalHelper.userBox.listenable(),
      builder: (context, box, child) {
        bool isDark = LocalHelper.getData(LocalHelper.kIsDark) ?? false;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          theme: AppThems.lightTheme,
          darkTheme: AppThems.darkTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
