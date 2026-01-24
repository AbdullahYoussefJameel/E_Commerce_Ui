import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
//import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

// class ThemeControllers extends GetxController {
//   final _box = GetStorage();
//   final _key = "isDarkMode";
//   ThemeMode get theme => _Loadtheme() ? ThemeMode.dark : ThemeMode.light;
//   bool get isDarkMode => _Loadtheme();
//   bool _Loadtheme() => _box.read(_key) ?? false;
//   void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);
//   void toggleTheme() {
//     Future.delayed(const Duration(milliseconds: 50), () {
//       Get.changeThemeMode(_Loadtheme() ? ThemeMode.light : ThemeMode.dark);
//       update();
//     });
//   }
// }
class ThemeControllers extends GetxController {
  final GetStorage _box = GetStorage();
  final String _key = "isDarkMode";

  /// قراءة الثيم عند تشغيل التطبيق
  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  bool get isDarkMode => _box.read(_key) ?? false;

  /// حفظ الثيم
  void saveTheme(bool value) {
    _box.write(_key, value);
  }

  /// تبديل الثيم
  void toggleTheme() {
    bool newValue = !isDarkMode;

    saveTheme(newValue);

    Get.changeThemeMode(newValue ? ThemeMode.dark : ThemeMode.light);

    update();
  }
}
