import 'package:e_commerce_app_ui/controllers/auth_controller.dart';
import 'package:e_commerce_app_ui/controllers/theme_controllers.dart';
import 'package:e_commerce_app_ui/utils/app_themes.dart';
import 'package:e_commerce_app_ui/view/custom_botton_nav.dart';
import 'package:e_commerce_app_ui/view/navigation_controller.dart';

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
  Get.put(CustomBottonNavbar());
  Get.put(NavigationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeControllers>();
    final NavigationController navigationController =
        Get.find<NavigationController>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'story',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
      home: SplashScreen(),
    );
  }
}
