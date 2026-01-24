import 'package:e_commerce_app_ui/controllers/auth_controller.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:e_commerce_app_ui/view/widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController();
  int _currentpage = 0;
  final List<OnLodingItem> _items = [
    OnLodingItem(
      image: 'assets/images/intro.png',
      title: 'Discover Lattest Trends',
      description: 'description',
    ),
    OnLodingItem(
      image: "assets/images/intro1.png",
      title: 'Quality products',
      description: 'shop premium quality prodcts from top brands',
    ),
    OnLodingItem(
      image: "assets/images/intro2.png",
      title: 'Easy shopping ',
      description: 'Simple and secure shoping ecperience at your fingertips ',
    ),
  ];
  //handle get started
  void _handleGetstarted() {
    final AuthController authController = Get.find<AuthController>();
    authController.setFirstTimeDone();
    Get.off(() => SigninScreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentpage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    _items[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextst.withColor(
                      AppTextst.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 32),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextst.withColor(
                        AppTextst.bodylarg,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentpage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentpage == index
                        ? Theme.of(context).primaryColor
                        : isDark
                        ? Colors.grey[700]
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _handleGetstarted(),
                  child: Text(
                    "skip",
                    style: AppTextst.withColor(
                      AppTextst.buttonmedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentpage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _handleGetstarted();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentpage < _items.length - 1 ? 'Next' : 'Get started',
                    style: AppTextst.withColor(
                      AppTextst.buttonmedium,
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnLodingItem {
  final String title;
  final String image;
  final String description;

  OnLodingItem({
    required this.title,
    required this.image,
    required this.description,
  });
}
