import 'package:e_commerce_app_ui/modles/product.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';

class productCard extends StatelessWidget {
  final Product product;
  const productCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.light;

    return Container(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // favorite button
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite
                        ? Theme.of(context).primaryColor
                        : isDark
                        ? Colors.grey[400]
                        : Colors.grey,
                  ),
                ),
              ),
              if (product.oldprice != null)
                Positioned(
                  left: 8, // فقط من اليسار
                  top: 8, // حسب المكان الذي تريد وضعه فيه
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    //discount text
                    child: Text(
                      '${calculateDiscount(product.price, product.oldprice)}',

                      style: AppTextst.withColor(
                        AppTextst.withWeight(
                          AppTextst.bodysmall,
                          FontWeight.bold,
                        ),
                        Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          //product details
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextst.withColor(
                    AppTextst.withWeight(AppTextst.h3, FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  product.category,
                  style: AppTextst.withColor(
                    AppTextst.bodymedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Row(
                  children: [
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: AppTextst.withColor(
                        AppTextst.withWeight(
                          AppTextst.bodylarg,
                          FontWeight.bold,
                        ),
                        Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                    ),
                    if (product.oldprice != null) ...{
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        "\$${product.oldprice!.toStringAsFixed(2)}",
                        style: AppTextst.withColor(
                          AppTextst.bodysmall,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ).copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    },
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //calculate discount
  int calculateDiscount(double currentprice, double oldprice) {
    return (((oldprice - currentprice) / oldprice) * 100).round();
  }
}
