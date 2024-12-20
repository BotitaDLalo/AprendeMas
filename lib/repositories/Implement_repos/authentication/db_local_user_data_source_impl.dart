import 'package:aprende_mas/config/environment/db/querys.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/db_local_user_data_source.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/environment/db/db_local.dart';

class DbLocalUserDataSourceImpl implements DbLocalUserDataSource {
  static const table = 'tbUsuarioActivo';

  @override
  Future<void> deleteUser() async {
    try {
      Database db = await DbLocal.initDatabase();
      final lsQuerys = Querys.querysDeleteTables();
      for (var q in lsQuerys) {
        await db.execute(q);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUser(String fechaLimiteActivo) async {
    try {
      Database db = await DbLocal.initDatabase();
      final query = Querys.querytbUsuarioActivoUpdate();

      final ls = await db.rawUpdate(query, [fechaLimiteActivo]);
      print(ls);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Map<String, Object?>>> getUser() async {
    try {
      Database db = await DbLocal.initDatabase();
      if (db.isOpen) {
        List<Map<String, Object?>> user = await db.query(table, limit: 1);
        print(user[0]);
        return user;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<void> insertUser(int usuarioId, String nombreUsuario, String correo,
      String fechaLimiteActivo, rol) async {
    try {
      Database db = await DbLocal.initDatabase();
      final query = Querys.querytbUsuarioActivoInsert();

      final ls = await db.transaction(
        (txn) async {
          await txn.rawInsert(query,
              [usuarioId, nombreUsuario, correo, fechaLimiteActivo, rol]);
        },
      );

      print(ls);
    } catch (e) {
      throw Exception(e);
    }
  }
}
