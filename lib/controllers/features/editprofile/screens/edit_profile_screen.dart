import 'package:e_commerce_app_ui/controllers/features/editprofile/widget/profile_image.dart';
import 'package:e_commerce_app_ui/controllers/features/editprofile/widget/profileform.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Edit Profile",
          style: AppTextst.withColor(
            AppTextst.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            ProfileImage(),
            const SizedBox(height: 34),
            Profileform(),
          ],
        ),
      ),
    );
  }
}
