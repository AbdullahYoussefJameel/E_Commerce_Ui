import 'package:e_commerce_app_ui/view/custom_botton_nav.dart';
import 'package:e_commerce_app_ui/view/navigation_controller.dart';
import 'package:e_commerce_app_ui/view/widgets/AccountScreen.dart';
import 'package:e_commerce_app_ui/view/widgets/HomeScrean.dart';
import 'package:e_commerce_app_ui/view/widgets/ShoppingScreen.dart';
import 'package:e_commerce_app_ui/view/widgets/WishListScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(
        () => IndexedStack(
          index: navigationController.currentIndex.value,
          children: [
            Homescrean(),
            Shoppingscreen(),
            Wishlistscreen(),
            Accountscreen(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottonNavbar(),
    );
  }
}
