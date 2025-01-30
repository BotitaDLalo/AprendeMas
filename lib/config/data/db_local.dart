import 'package:aprende_mas/config/data/querys.dart';
import 'package:aprende_mas/config/utils/packages.dart';

class DbLocal {
  static Future<Database> initDatabase() async {
    try {
      final databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'Movil.db');
      await deleteDatabase(path);
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
        debugPrint("TABLAS CREADAS");
        debugPrint(result.toString());
        return db;
      } else {
        Database db = await openDatabase(path, version: 1);

        final result = await db
            .rawQuery('SELECT name FROM sqlite_master WHERE type="table"');
        debugPrint("TABLAS CREADAS PERO LA BD EXISTE");
        debugPrint(result.toString());
        debugPrint("SU CONTENIDO: ");

//& tbUsuarioActivo
        final usuarioActivo =
            await db.rawQuery('SELECT * FROM tbUsuarioActivo');
        debugPrint("tbUsuarioActivo: ");

        debugPrint(usuarioActivo.toString());

//& tbGrupos
        final grupos = await db.rawQuery('SELECT * FROM tbGrupos');
        debugPrint("tbGrupos");
        debugPrint(grupos.toString());

//& tbMaterias
        final materias = await db.rawQuery('SELECT * FROM tbMaterias');
        debugPrint("tbMaterias");
        debugPrint(materias.toString());

//& tbActividades
        final actividades = await db.rawQuery('SELECT * FROM tbActividades');
        debugPrint("tbActividades");
        debugPrint(actividades.toString());

//& tbGruposMaterias
        final gruposMaterias =
            await db.rawQuery('SELECT * FROM tbGruposMaterias');
        debugPrint("tbGruposMaterias");
        debugPrint(gruposMaterias.toString());

//& tbMateriasActividades
        final materiasActividades =
            await db.rawQuery('SELECT * FROM tbMateriasActividades');
        debugPrint("tbMateriasActividades");
        debugPrint(materiasActividades.toString());

//& tbAlumnosActividades
        final alumnosActividades =
            await db.rawQuery('SELECT * FROM tbAlumnosActividades');
        debugPrint("tbAlumnosActividades");
        debugPrint(alumnosActividades.toString());

//& tbEntregableActividades
        final entregableActividades =
            await db.rawQuery('SELECT * FROM tbEntregableActividades');
        debugPrint("tbEntregableActividades");
        debugPrint(entregableActividades.toString());

//& tbNotificaciones
        final notificaciones =
            await db.rawQuery('SELECT * FROM tbNotificaciones');
        debugPrint("tbNotificaciones");
        debugPrint(notificaciones.toString());

        return db;
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
