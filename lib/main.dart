import 'package:e_commerce_app_ui/controllers/auth_controller.dart';
import 'package:e_commerce_app_ui/controllers/theme_controllers.dart';
import 'package:e_commerce_app_ui/utils/app_themes.dart';
import 'package:e_commerce_app_ui/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeControllers());
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theameController = Get.find<ThemeControllers>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'story',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: theameController.theme,
      defaultTransition: Transition.fade,
      home: SplashScreen(),
    );
  }
}
