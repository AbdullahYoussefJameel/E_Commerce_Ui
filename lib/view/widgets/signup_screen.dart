import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:e_commerce_app_ui/view/main_screen.dart';
import 'package:e_commerce_app_ui/view/widgets/custom_textfiled.dart';
import 'package:e_commerce_app_ui/view/widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
              //back button
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Create Account",
                style: AppTextst.withColor(
                  AppTextst.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Signup to get started",
                style: AppTextst.withColor(
                  AppTextst.bodylarg,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),
              //full name textfiled
              CustomTextfiled(
                label: "Full Name",
                prefixIcon: Icons.person_outline,
                keyboardTybe: TextInputType.name,
                controller: _nameController,
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return 'please enter your name';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              //email textfiled
              CustomTextfiled(
                label: "Email",
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
              //password textfiled
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
              const SizedBox(height: 16),
              //confirm password textfiled
              CustomTextfiled(
                label: "Confirm Password",
                prefixIcon: Icons.lock_outline,
                keyboardTybe: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordcontroller,
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return 'please confirm your password';
                  }
                  if (Value != _passwordcontroller.text) {
                    return 'Password do not match ';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 24),
              //sigup button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => MainScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: AppTextst.withColor(
                      AppTextst.buttonmedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              //signin textbutton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTextst.withColor(
                      AppTextst.bodymedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.off(() => SigninScreen()),
                    child: Text(
                      "sign in",
                      style: AppTextst.withColor(
                        AppTextst.buttonmedium,
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
}
