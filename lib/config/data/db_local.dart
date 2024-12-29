import 'package:aprende_mas/config/data/querys.dart';
import 'package:aprende_mas/config/utils/packages.dart';

class DbLocal {
  static Future<Database> initDatabase() async {
    try {
      final databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'Movil.db');
      bool exist = await File(path).exists();

      if (!exist) {
        List<String> lsQuerys = Querys.querysCreateTables();

        Database db =
            await openDatabase(path, version: 1, onCreate: (db, version) async {
          for (var q in lsQuerys) {
            await db.execute(q);
          }
        });

        final result = await db
            .rawQuery('SELECT name FROM sqlite_master WHERE type="table"');
        print("TABLAS CREADAS");
        print(result);
        // Devuelve los nombres de las tablas como una lista de strings
        // final ls =  result.map((e) => e['name'] as String).toList();
        // print("TABLAS EXISTENTES");
        // print(ls);
        return db;
      } else {
        Database db = await openDatabase(path, version: 1);
        return db;
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
