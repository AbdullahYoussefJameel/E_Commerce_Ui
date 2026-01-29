import 'package:e_commerce_app_ui/controllers/features/hellp%20center/views/widgets/question_card.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';

class PopluarQuestionsSection extends StatelessWidget {
  const PopluarQuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Questions",
            style: AppTextst.withColor(
              AppTextst.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 16),
          QuestionCard(
            title: "How to track my order?",
            icon: Icons.local_shipping_outlined,
          ),
          const SizedBox(height: 12),
          QuestionCard(
            title: "How to return an item?",
            icon: Icons.local_shipping_outlined,
          ),
        ],
      ),
    );
  }
}
