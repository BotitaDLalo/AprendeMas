import 'package:aprende_mas/config/data/querys.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_user_offline_data_source.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/data/db_local.dart';

class AuthUserOfflineDataSourceImpl implements AuthUserOfflineDataSource {
  static const table = 'tbUsuarioActivo';

  @override
  Future<void> deleteUser() async {
    try {
      Database db = await DbLocal.initDatabase();
      if (db.isOpen) {
        final lsQuerys = Querys.querysDeleteTables();
        for (var q in lsQuerys) {
          await db.execute(q);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUser(String fechaLimiteActivo) async {
    try {
      Database db = await DbLocal.initDatabase();
      if (db.isOpen) {
        final query = Querys.querytbUsuarioActivoUpdate();
        await db.rawUpdate(query, [fechaLimiteActivo]);
      }
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
      if (db.isOpen) {
        final query = Querys.querytbUsuarioActivoInsert();

        await db.transaction(
          (txn) async {
            await txn.rawInsert(query,
                [usuarioId, nombreUsuario, correo, fechaLimiteActivo, rol]);
          },
        );
      }
      await db.close();
    } catch (e) {
      debugPrint(e.toString());
    }finally{
      
      Database db = await DbLocal.initDatabase();
      await db.close();

    }
  }
}