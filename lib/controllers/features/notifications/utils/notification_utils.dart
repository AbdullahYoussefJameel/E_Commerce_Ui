import 'package:e_commerce_app_ui/controllers/features/notifications/modles/notifications_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationUtils {
  static IconData getNotificationIcon(NotificationsType type) {
    switch (type) {
      case NotificationsType.order:
        return Icons.shopping_bag_outlined;
      case NotificationsType.deliverd:
        return Icons.local_shipping_outlined;
      case NotificationsType.promo:
        return Icons.local_offer_outlined;
      case NotificationsType.payment:
        return Icons.payment_outlined;
    }
  }

  static Color getIconBackgroundColor(
    BuildContext context,
    NotificationsType type,
  ) {
    switch (type) {
      case NotificationsType.order:
        return Theme.of(context).primaryColor.withOpacity(0.1);
      case NotificationsType.deliverd:
        return Colors.green[100]!;
      case NotificationsType.promo:
        return Colors.orange[100]!;
      case NotificationsType.payment:
        return Colors.red[100]!;
    }
  }

  static Color getIconColor(BuildContext context, NotificationsType type) {
    switch (type) {
      case NotificationsType.order:
        return Theme.of(context).primaryColor.withOpacity(0.1);
      case NotificationsType.deliverd:
        return Colors.green;
      case NotificationsType.promo:
        return Colors.orange;
      case NotificationsType.payment:
        return Colors.red;
    }
  }
}
