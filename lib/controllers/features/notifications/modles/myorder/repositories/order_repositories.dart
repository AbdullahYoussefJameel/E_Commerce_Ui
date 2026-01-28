import 'package:e_commerce_app_ui/controllers/features/notifications/modles/myorder/model/order.dart';

class OrderRepositories {
  List<Order> getOrders() {
    return [
      Order(
        OrderNumber: '1231',
        itemCount: 2,
        totalAmount: 2938.3,
        status: OrderStatus.active,
        imageUrl: 'assets/images/shoe.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Order(
        OrderNumber: '2132',
        itemCount: 3,
        totalAmount: 238.3,
        status: OrderStatus.active,
        imageUrl: 'assets/images/shoes2.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Order(
        OrderNumber: '3121',
        itemCount: 1,
        totalAmount: 242.3,
        status: OrderStatus.completed,
        imageUrl: 'assets/images/laptop.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Order(
        OrderNumber: '76123',
        itemCount: 5,
        totalAmount: 512.3,
        status: OrderStatus.cancelled,
        imageUrl: 'assets/images/shoe2.jpg ',
        orderDate: DateTime.now().subtract(const Duration(hours: 7)),
      ),
    ];
  }

  List<Order> getOrdersByStatus(OrderStatus status) {
    return getOrders().where((Order) => Order.status == status).toList();
  }
}
