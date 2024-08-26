import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_menu.dart';
import 'main_page.dart';
import 'utils/theme/theme.dart';


class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: MainScreen(),
    );
  }
}
