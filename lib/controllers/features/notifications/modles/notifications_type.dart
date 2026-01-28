enum NotificationsType { order, deliverd, promo, payment }

class NotificationsItem {
  final String title;
  final String message;
  final String time;
  final NotificationsType type;
  final bool isRead;

  NotificationsItem({
    this.isRead = false,
    required this.message,
    required this.type,
    required this.title,
    required this.time,
  });
}
