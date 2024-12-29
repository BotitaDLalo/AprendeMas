import 'package:aprende_mas/models/models.dart';

abstract class DbLocalNoticesRepository {
  Future<bool> storeNotification(Notice notice);

  Future<List<Notice>> getLastNotification();

  Future<List<Notice>> getLsNotifications();

  Future<bool> deleteNotification(String sentDate);
  
}
