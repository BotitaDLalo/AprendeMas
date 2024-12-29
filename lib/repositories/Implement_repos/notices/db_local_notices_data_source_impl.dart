import 'package:aprende_mas/config/data/data.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/notices/db_local_notices_data_source.dart';
import 'package:aprende_mas/config/utils/packages.dart';

class DbLocalNoticesDataSourceImpl implements DbLocalNoticesDataSource {
  @override
  Future<bool> storeNotification(Notice notice) async {
    try {
      bool inserted = false;
      Database db = await DbLocal.initDatabase();
      final query = Querys.querytbNotificacionesInsert();
      await db.transaction((txn) async {
        int idRow = await txn.rawInsert(query, [
          notice.messageId,
          notice.title,
          notice.body,
          notice.sentDate.toString(),
          "",
          ""
        ]);

        if (idRow > 0) {
          inserted = true;
        }
      });
      return inserted;
    } catch (e) {
      print(e);
      return false;
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

  @override
  Future<List<Notice>> getLsNotifications() async {
    try {
      Database db = await DbLocal.initDatabase();
      final ls = await db.query('tbNotificaciones', orderBy: 'FechaEnvio DESC');

      final lsNotice = Notice.noticeJsonToEntity(ls);

      for (var n in lsNotice) {
        print("Aviso: " + n.toString());
      }
      return lsNotice;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> deleteNotification(String sentDate) async {
    try {
      Database db = await DbLocal.initDatabase();
      final query = Querys.querytbNotificacionesDeleteWhere();
      int count = await db.rawDelete(query, [sentDate]);

      if (count == 1) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
