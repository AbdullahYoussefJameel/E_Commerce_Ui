import 'package:e_commerce_app_ui/controllers/features/notifications/modles/myorder/model/order.dart';
import 'package:e_commerce_app_ui/controllers/features/notifications/modles/myorder/repositories/order_repositories.dart';
import 'package:e_commerce_app_ui/controllers/features/notifications/modles/myorder/view/widgets/order_card.dart';
import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});

  final OrderRepositories _repository = OrderRepositories();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          title: Text(
            "My Orders",
            style: AppTextst.withColor(
              AppTextst.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: isDark
                ? Colors.grey.shade400
                : Colors.grey.shade600,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: "active"),
              Tab(text: "completed"),
              Tab(text: "cancelled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList(context, OrderStatus.active),
            _buildOrderList(context, OrderStatus.cancelled),
            _buildOrderList(context, OrderStatus.completed),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, OrderStatus status) {
    final orders = _repository.getOrdersByStatus(status);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) =>
          OrderCard(order: orders[index], onViewDetails: () {}),
    );
  }
}
