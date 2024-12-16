import 'package:aprende_mas/models/models.dart';

abstract class DbLocalNoticesRepository {
  Future<void> storeNotification(Notice notice);

  Future<List<Notice>> getLastNotification();

  Future<List<Notice>> getLsNotifications();
  
}
