import 'package:e_commerce_app_ui/controllers/features/provacy%20policy/views/widgets/info_section.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Terms of Service ',
          style: AppTextst.withColor(
            AppTextst.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                title: "Welcome to Fashion Store",
                content:
                    "Welcome to Fashion Store. By accessing or using this application, you agree to comply with and be bound by these terms and conditions. Please read them carefully before using the app.",
              ),

              InfoSection(
                title: "Account Registration",
                content:
                    "To access certain features of the application, you may be required to create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.",
              ),

              InfoSection(
                title: "User Responsibilities",
                content:
                    "Users agree to use the application only for lawful purposes. You must not misuse the app, attempt to gain unauthorized access, or engage in any activity that could harm the application or other users.",
              ),

              InfoSection(
                title: "Privacy Policy",
                content:
                    "Your privacy is important to us. We collect and use your personal information only as necessary to provide and improve our services, in accordance with our Privacy Policy.",
              ),

              InfoSection(
                title: "Intellectual Property",
                content:
                    "All content, trademarks, logos, and intellectual property displayed in the application are the exclusive property of Fashion Store and may not be used, copied, or distributed without prior written permission.",
              ),

              InfoSection(
                title: "Termination",
                content:
                    "We reserve the right to suspend or terminate your access to the application at any time, without prior notice, if you violate these terms or engage in any harmful or unlawful behavior.",
              ),

              const SizedBox(height: 24),

              Text(
                'Last updated" March 2026 ',
                style: AppTextst.withColor(
                  AppTextst.bodysmall,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
