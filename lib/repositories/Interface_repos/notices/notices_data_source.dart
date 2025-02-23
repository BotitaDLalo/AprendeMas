import 'package:aprende_mas/models/models.dart';
abstract class NoticesDataSource {
  Future<List<NoticeModel>> createNotice(NoticeModel notice);
  Future<List<NoticeModel>> getlsNotices(NoticeModel notice);
  Future<bool> deleteNotice(int notice);
}
