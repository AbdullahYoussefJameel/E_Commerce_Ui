import 'package:e_commerce_app_ui/controllers/features/provacy%20policy/views/screens/provacy_policy_screen.dart';
import 'package:e_commerce_app_ui/controllers/features/terms%20of%20service%20/view/screens/terms_of_service_screen.dart';
import 'package:e_commerce_app_ui/controllers/theme_controllers.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "settings ",
          style: AppTextst.withColor(
            AppTextst.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(context, 'Appearance', [_buildThemeToggle(context)]),
            _buildSection(context, 'Notifications', [
              _bulidSwitchTile(
                context,
                'Email Notifications',
                'Receive push notifications about order and promotions ',
                true,
              ),
              _bulidSwitchTile(
                context,
                'push Notifications',
                'Receive email updates about your orders',
                false,
              ),
            ]),
            _buildSection(context, 'Privacy', [
              _buildNavigationTitle(
                context,
                'Privacy policy',
                'view our privacy policy ',
                Icons.privacy_tip_outlined,
                onTap: () => Get.to(() => ProvacyPolicyScreen()),
              ),
              _buildNavigationTitle(
                context,
                'Terms of Service',
                'Read our terms of service ',
                Icons.description_outlined,
                onTap: () => Get.to(() => TermsOfServiceScreen()),
              ),
            ]),
            _buildSection(context, 'about', [
              _buildNavigationTitle(
                context,
                "App Version",
                '1.0.0 ',
                Icons.info_outline,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Text(
            title,
            style: AppTextst.withColor(
              AppTextst.h3,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<ThemeControllers>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            "Dark Mode ",
            style: AppTextst.withColor(
              AppTextst.bodymedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          trailing: Switch.adaptive(
            value: controller.isDarkMode,
            onChanged: (value) => controller.toggleTheme(),
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _bulidSwitchTile(
    BuildContext context,
    String title,
    String subtitle,
    bool initialValue,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTextst.withColor(
            AppTextst.bodymedium,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextst.withColor(
            AppTextst.bodysmall,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
        trailing: Switch.adaptive(
          value: initialValue,
          onChanged: (value) {},
          activeColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildNavigationTitle(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(
            title,
            style: AppTextst.withColor(
              AppTextst.bodysmall,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextst.withColor(
              AppTextst.bodysmall,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
