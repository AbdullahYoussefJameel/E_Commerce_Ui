import 'package:e_commerce_app_ui/controllers/auth_controller.dart';
import 'package:e_commerce_app_ui/view/main_screen.dart';
import 'package:e_commerce_app_ui/view/widgets/onbording_screen.dart';
import 'package:e_commerce_app_ui/view/widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    //navigate based on auth state after2.5 seconds
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (authController.isFirstTime) {
        Get.off(() => const OnbordingScreen());
      } else if (authController.isLoggedIn) {
        Get.off(() => const MainScreen());
      } else {
        Get.off(() => SigninScreen());
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.8),
                  Theme.of(context).primaryColor.withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Grid background
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: GridePattern(color: Colors.white),
            ),
          ),

          // Main content in center
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon animation
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 48,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Title animation
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    children: const [
                      Text(
                        "FASHON",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 8,
                        ),
                      ),
                      Text(
                        "STORE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom tagline
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1200),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: const Text(
                "Style Meets Simplicity",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= GRID BACKGROUND =================

class GridePattern extends StatelessWidget {
  final Color color;

  const GridePattern({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: GridPainter(color: color));
  }
}

class GridPainter extends CustomPainter {
  final Color color;

  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;

    const spacing = 20.0;

    // Vertical lines
    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // Horizontal lines
    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
