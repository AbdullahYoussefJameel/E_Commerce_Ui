import 'package:e_commerce_app_ui/controllers/theme_controllers.dart';
import 'package:e_commerce_app_ui/view/widgets/cart_screen.dart';
import 'package:e_commerce_app_ui/view/widgets/category_chips.dart';
import 'package:e_commerce_app_ui/view/widgets/custom_saerch_bar.dart';
import 'package:e_commerce_app_ui/view/widgets/product_grid.dart';
import 'package:e_commerce_app_ui/view/widgets/sele_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:get/utils.dart';

class Homescrean extends StatelessWidget {
  const Homescrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo Abody",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        "Good Morning",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  //noification icon
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  //cart button
                  IconButton(
                    onPressed: () => Get.to(() => CartScreen()),
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                  //theme button
                  GetBuilder<ThemeControllers>(
                    builder: (controller) => IconButton(
                      onPressed: () => controller.toggleTheme(),
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //search bar
            const CustomSaerchBar(),

            //category chips
            const CategoryChips(),
            //sale banner
            const SeleBanner(),

            //popular product
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Pupular Product",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),

            //product grid
            const Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
