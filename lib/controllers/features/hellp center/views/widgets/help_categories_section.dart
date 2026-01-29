import 'package:e_commerce_app_ui/controllers/features/hellp%20center/views/widgets/category_card.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HelpCategoriesSection extends StatelessWidget {
  const HelpCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Category = [
      {'icon': Icons.shopping_bag_outlined, 'title': 'Orders'},
      {'icon': Icons.payment_outlined, 'title': 'Payments'},
      {'icon': Icons.local_shipping_outlined, 'title': 'Shopping'},
      {'icon': Icons.assignment_return_outlined, 'title': 'Returns'},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Help categories',
            style: AppTextst.withColor(
              AppTextst.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: Category.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                title: Category[index]["title"] as String,
                icon: Category[index]["icon"] as IconData,
              );
            },
          ),
        ],
      ),
    );
  }
}
