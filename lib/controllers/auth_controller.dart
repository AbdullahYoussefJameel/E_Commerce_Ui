import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _storage = GetStorage();

  // الحالة داخل التطبيق
  final RxBool _isFirstTime = true.obs;
  final RxBool _isLoggedIn = false.obs;

  // Getters للواجهة
  bool get isFirstTime => _isFirstTime.value;
  bool get isLoggedIn => _isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    _loadInitialStates();
  }

  // تحميل الحالة من التخزين عند بدء التطبيق
  void _loadInitialStates() {
    _isFirstTime.value = _storage.read('isFirstTime') ?? true;
    _isLoggedIn.value = _storage.read('isLoggedIn') ?? false;
  }

  // تعيين أن المستخدم فتح التطبيق لأول مرة
  void setFirstTimeDone() {
    _isFirstTime.value = false;
    _storage.write('isFirstTime', false);
  }

  // دالة تسجيل الدخول
  void login() {
    _isLoggedIn.value = true;
    _storage.write('isLoggedIn', true);
  }

  // دالة تسجيل الخروج
  void logout() {
    _isLoggedIn.value = false;
    _storage.write('isLoggedIn', false);
  }
}
