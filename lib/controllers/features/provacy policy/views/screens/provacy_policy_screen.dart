import 'package:e_commerce_app_ui/controllers/features/provacy%20policy/views/widgets/info_section.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class ProvacyPolicyScreen extends StatelessWidget {
  const ProvacyPolicyScreen({super.key});

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
          'Provacy Policy',
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
              const InfoSection(
                title: "Information We Collect",
                content:
                    "We collect information that you provide directly to us, such as your name, email address, shipping details, and purchase history when you use our application.",
              ),

              const InfoSection(
                title: "How We Use Your Information",
                content:
                    "We use the information we collect to provide, maintain, and improve our services, process your transactions, communicate with you, and send important updates related to your account and orders.",
              ),

              const InfoSection(
                title: "Information Sharing",
                content:
                    "We do not sell or rent your personal information. Your data may be shared only with trusted third-party service providers when necessary to operate our services or comply with legal obligations.",
              ),

              const InfoSection(
                title: "Data Security",
                content:
                    "We take reasonable measures to protect your personal information from unauthorized access, loss, misuse, or disclosure by implementing appropriate security practices.",
              ),

              const InfoSection(
                title: "Your Rights",
                content:
                    "You have the right to access, update, or delete your personal information. You may also request restrictions on how your data is used, subject to applicable laws.",
              ),

              const InfoSection(
                title: "Cookie Policy",
                content:
                    "We use cookies and similar technologies to enhance your experience, analyze usage patterns, and improve the functionality of our application. You can manage cookie preferences through your device settings.",
              ),

              const SizedBox(height: 24),

              Text(
                'Last updated: March 2026',
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
