import 'package:aprende_mas/models/notice_list/notice.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/db_local_notices_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/notices/db_local_notices_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/notices/db_local_notices_repository.dart';

class DbLocalNoticesRepositoryImpl implements DbLocalNoticesRepository {
  final DbLocalNoticesDataSource noticesDataSource;

  DbLocalNoticesRepositoryImpl({DbLocalNoticesDataSource? dataSource})
      : noticesDataSource = dataSource ?? DbLocalNoticesDataSourceImpl();

  @override
  Future<bool> storeNotification(Notice notice) {
    return noticesDataSource.storeNotification(notice);
  }

  @override
  Future<List<Notice>> getLsNotifications() {
    return noticesDataSource.getLsNotifications();
  }

  @override
  Future<bool> deleteNotification(String sentDate) {
    return noticesDataSource.deleteNotification(sentDate);
  }
}
