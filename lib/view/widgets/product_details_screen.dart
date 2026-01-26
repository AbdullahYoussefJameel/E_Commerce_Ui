import 'package:e_commerce_app_ui/modles/product.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:e_commerce_app_ui/view/widgets/all-products-screen.dart';
import 'package:e_commerce_app_ui/view/widgets/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product prodeuct;
  const ProductDetailsScreen({super.key, required this.prodeuct});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHight = screenSize.height;
    final screenWidtht = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context),
          icon: Icon(Icons.arrow_back),
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          "Details",
          style: AppTextst.withColor(
            AppTextst.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          //share buttom
          IconButton(
            onPressed: () =>
                _shareProduct(context, prodeuct.name, prodeuct.description),
            icon: Icon(
              Icons.share,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //image
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    prodeuct.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                //favorite buttom
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      prodeuct.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: prodeuct.isFavorite
                          ? Theme.of(context).primaryColor
                          : isDark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            //produuct details
            Padding(
              padding: EdgeInsets.all(screenWidtht * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          prodeuct.name,
                          style: AppTextst.withColor(
                            AppTextst.h2,
                            Theme.of(context).textTheme.headlineMedium!.color!,
                          ),
                        ),
                      ),
                      Text(
                        '\$${prodeuct.price.toStringAsFixed(2)} ',
                        style: AppTextst.withColor(
                          AppTextst.h2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    prodeuct.category,
                    style: AppTextst.withColor(
                      AppTextst.bodymedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  SizedBox(height: screenHight * 0.02),
                  Text(
                    'Select Size',
                    style: AppTextst.withColor(
                      AppTextst.labelmedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(height: screenHight * 0.01),
                  //size selector
                  SizeSelector(),
                  SizedBox(height: screenHight * 0.01),
                  Text(
                    'Description',
                    style: AppTextst.withColor(
                      AppTextst.labelmedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(height: screenHight * 0.01),
                  Text(
                    prodeuct.description,
                    style: AppTextst.withColor(
                      AppTextst.bodysmall,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //buttom
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidtht * 0.04),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidtht * 0.02,
                    ),
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black12,
                    ),
                  ),

                  child: Text(
                    "add to card",
                    style: AppTextst.withColor(
                      AppTextst.buttonmedium,

                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidtht * 0.04),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => AllProductsScreen()),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidtht * 0.02,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),

                  child: Text(
                    "Buy Now",
                    style: AppTextst.withColor(
                      AppTextst.buttonmedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //share product
  Future<void> _shareProduct(
    BuildContext context,
    String productName,
    String description,
  ) async {
    //get the render box for share position origin (required for ipad)
    final box = context.findRenderObject() as RenderBox?;
    const String shopLink = " http//your shope//product/cotton-tshirt";
    final String shareMassage = '$description\n\nShope now at $shopLink ';
    try {
      final ShareResult result = await Share.share(
        shareMassage,
        subject: productName,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
      if (result.status == ShareResultStatus.success) {
        debugPrint('thank you for sharing!');
      }
    } catch (e) {
      debugPrint('error sharing: $e');
    }
  }
}
