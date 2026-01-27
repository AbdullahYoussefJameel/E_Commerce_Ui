import 'package:e_commerce_app_ui/controllers/features/notifications/modles/notifications_type.dart';

class notificationRepository {
  List<NotificationsItem> getnotification() {
    return [
      NotificationsItem(
        message: "your order has been conformed and is beign proccessed",
        type: NotificationsType.promo,
        title: "Order confirmed",
        time: "2 minutes ago ",
        isRead: true,
      ),
      NotificationsItem(
        message: "Get 20% off an all shoes this weekend!",
        type: NotificationsType.order,
        title: "Special Offer!",
        time: "1 hour ago ",
        isRead: true,
      ),
      NotificationsItem(
        message: "your order has been conformed and is beign proccessed",
        type: NotificationsType.deliverd,
        title: "Your order is #123443 is out for delivery . ",
        time: "3 hour ago ",
        isRead: true,
      ),
      NotificationsItem(
        message: "payment for order #43232 was successful ",
        type: NotificationsType.payment,
        title: "Payment Successful ",
        time: "2 minutes ago ",
        isRead: true,
      ),
    ];
  }
}
