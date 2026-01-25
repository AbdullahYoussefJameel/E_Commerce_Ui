import 'package:e_commerce_app_ui/controllers/auth_controller.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:e_commerce_app_ui/view/main_screen.dart';
import 'package:e_commerce_app_ui/view/widgets/custom_textfiled.dart';
import 'package:e_commerce_app_ui/view/widgets/forget_password_secreen.dart';
import 'package:e_commerce_app_ui/view/widgets/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              Text(
                "Welcome Back!",
                style: AppTextst.withColor(
                  AppTextst.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "sign in to continue shopping",
                style: AppTextst.withColor(
                  AppTextst.bodylarg,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),
              //email textfiled
              CustomTextfiled(
                label: "email",
                prefixIcon: Icons.email_outlined,
                keyboardTybe: TextInputType.emailAddress,
                controller: _emailcontroller,
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return 'please enter your email';
                  }
                  if (!GetUtils.isEmail(Value)) {
                    return 'please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              //password textfeiled
              CustomTextfiled(
                label: "password",
                prefixIcon: Icons.lock_outline,
                keyboardTybe: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordcontroller,
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return 'please enter your password';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 8),
              //forget password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.off(() => ForgetPasswordScreen()),
                  child: Text(
                    "forget password?",
                    style: AppTextst.withColor(
                      AppTextst.buttonmedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              //signin button
              const SizedBox(height: 24),

              //signin button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Sign In",
                    style: AppTextst.withColor(
                      AppTextst.buttonmedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              //sign up textbutton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextst.withColor(
                      AppTextst.bodymedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => SignupScreen()),
                    child: Text(
                      "Sign Up",
                      style: AppTextst.withColor(
                        AppTextst.bodymedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignIn() {
    final AuthController authController = Get.find<AuthController>();
    authController.login();

    Get.offAll(() => const MainScreen());
  }
}

// Future<bool> login(String email, String password) async {
//   final response = await http.post(
//     Uri.parse('https://api.example.com/login'),
//     body: {'email': email, 'password': password},
//   );

//   if (response.statusCode == 200) {
//     _isLoggedIn.value = true;
//     _storage.write('isLoggedIn', true);
//     return true;
//   } else {
//     return false;
//   }
// }
