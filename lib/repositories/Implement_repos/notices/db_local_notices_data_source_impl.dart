import 'package:aprende_mas/config/environment/db/querys.dart';
import 'package:aprende_mas/repositories/Interface_repos/notices/db_local_notices_data_source.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/environment/db/db_local.dart';
import 'package:aprende_mas/models/models.dart';

class DbLocalNoticesDataSourceImpl implements DbLocalNoticesDataSource {
  @override
  Future<void> storeNotification(Notice notice) async {
    try {
      Database db = await DbLocal.initDatabase();
      final query = Querys.querytbNotificacionesInsert();
      await db.transaction((txn) async {
        await txn.rawInsert(query, [
          notice.messageId,
          notice.title,
          notice.body,
          notice.sentDate.toString(),
          "",
          notice.imageUrl.toString()
        ]);
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Notice>> getLastNotification() async {
    try {
      Database db = await DbLocal.initDatabase();

      // final query = Querys.querytbNotificacionesSelect();

      final ls = await db.query('tbNotificaciones',
          orderBy: 'FechaEnvio DESC', limit: 1);

      final lsNotice = Notice.noticeJsonToEntity(ls);

      return lsNotice;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<int> gettbNotificacionesCount() async {
    try {
      Database db = await DbLocal.initDatabase();
      final result =
          await db.rawQuery('SELECT COUNT(*) as count FROM tbNotificaciones');
      return Sqflite.firstIntValue(result) ?? 0;
    } catch (e) {
      throw Exception(e);
    }
  }
}
