import 'package:aprende_mas/models/models.dart';

abstract class DbLocalNotificationsDataSource {
  Future<bool> storeNotification(NotificationModel notice);

  Future<List<NotificationModel>> getLsNotifications();

  Future<bool> deleteNotification(String sentDate);
}
