import 'package:e_commerce_app_ui/controllers/features/ckeckout/widget/address_cardd.dart';
import 'package:e_commerce_app_ui/controllers/features/ckeckout/widget/checkout_bottom_bar.dart';
import 'package:e_commerce_app_ui/controllers/features/ckeckout/widget/order_summary_card.dart';
import 'package:e_commerce_app_ui/controllers/features/ckeckout/widget/payment_method_card.dart';
import 'package:e_commerce_app_ui/controllers/features/order%20confirmation/order_confirmation_screen.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ChackoutScreen extends StatelessWidget {
  const ChackoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          'Checkout',
          style: AppTextst.withColor(
            AppTextst.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, "Shopping Address"),
            const SizedBox(height: 16),
            AddressCardd(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, "Payment Method"),
            const SizedBox(height: 16),
            PaymentMethodCard(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, "Order Summary"),
            const SizedBox(height: 16),
            OrderSummaryCard(),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutBottomBar(
        totalAmount: 643.93,
        onPlaceOrder: () {
          //generate a roandom order number (in real app )
          final orderNumber =
              'ORD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
          Get.to(
            () => OrderConfirmationScreen(
              orderNumber: orderNumber,
              totalAoumt: 643.93,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextst.withColor(
        AppTextst.h3,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
    );
  }
}
