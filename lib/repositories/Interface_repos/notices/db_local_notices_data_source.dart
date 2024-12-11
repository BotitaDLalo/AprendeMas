import 'package:aprende_mas/models/models.dart';

abstract class DbLocalNoticesDataSource {
  Future<void> storeNotification(Notice notice);

  Future<List<Notice>> getLastNotification();
}
