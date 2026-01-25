import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';

class SeleBanner extends StatelessWidget {
  const SeleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Your",
                  style: AppTextst.withColor(AppTextst.h3, Colors.white),
                ),
                Text(
                  "Special Sale",
                  style: AppTextst.withColor(
                    AppTextst.withWeight(AppTextst.h2, FontWeight.bold),
                    Colors.white,
                  ),
                ),
                Text(
                  "Up to 40%",
                  style: AppTextst.withColor(AppTextst.h3, Colors.white),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: Text("shop Now", style: AppTextst.buttonmedium),
          ),
        ],
      ),
    );
  }
}
