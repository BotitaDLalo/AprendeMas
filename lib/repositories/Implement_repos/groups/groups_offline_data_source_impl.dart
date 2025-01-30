import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_offline_data_source.dart';
import 'package:aprende_mas/config/data/db_local.dart';

class GroupsOfflineDataSourceImpl implements GroupsOfflineDataSource {
  @override
  Future<List<Group>> getGroupsSubjects() async {
    try {
      int countGroups;
      final db = await DbLocal.initDatabase();

      if (db.isOpen) {
        final querylsGroups = await db.rawQuery('SELECT * FROM tbGrupos');
        countGroups = querylsGroups.length;
        if (countGroups != 0) {
          Future<List<Group>> lsGroups = Future.wait(querylsGroups.map(
            (e) async {
              int groupId = e['GrupoId'] as int;

              final querylsGroupsSubjectsId = await db.rawQuery(
                  "SELECT MateriaId FROM tbGruposMaterias WHERE GrupoId = ?",
                  [groupId]);

              return Group(
                  grupoId: e['GrupoId'] as int,
                  nombreGrupo: e['NombreGrupo'] as String,
                  descripcion: e['Descripcion'] as String,
                  codigoAcceso: e['CodigoAcceso'] as String,
                  codigoColor: e['CodigoColor'] as String,
                  materias: await Future.wait(querylsGroupsSubjectsId.map(
                    (e) async {
                      int subjectId = e['MateriaId'] as int;
                      final querySubject = await db.rawQuery(
                          "SELECT * FROM tbMaterias WHERE MateriaId = ?",
                          [subjectId]);

                      final querylsActivitiesId = await db.rawQuery(
                          "SELECT ActividadId FROM tbMateriasActividades WHERE MateriaId = ?",
                          [subjectId]);

                      return Subject(
                          materiaId: subjectId,
                          nombreMateria:
                              querySubject[0]['NombreMateria'] as String,
                          descripcion: querySubject[0]['Descripcion'] as String,
                          codigoAcceso:
                              querySubject[0]['CodigoAcceso'] as String,
                          codigoColor: querySubject[0]['CodigoColor'] as String,
                          actividades:
                              await Future.wait(querylsActivitiesId.map(
                            (e) async {
                              int activitieId = e['ActividadId'] as int;
                              final queryActivitie = await db.rawQuery(
                                  "SELECT * FROM tbActividades WHERE ActividadId = ?",
                                  [activitieId]);

                              return Activity(
                                  actividadId:
                                      queryActivitie[0]['ActividadId'] as int,
                                  nombreActividad: queryActivitie[0]
                                      ['NombreActividad'] as String,
                                  descripcion: queryActivitie[0]['Descripcion']
                                      as String,
                                  tipoActividadId: queryActivitie[0]
                                      ['TipoActividadId'] as int,
                                  fechaCreacion: queryActivitie[0]
                                      ['FechaCreacion'] as DateTime,
                                  fechaLimite: queryActivitie[0]['FechaLimite']
                                      as DateTime,
                                  materiaId:
                                      queryActivitie[0]['MateriaId'] as int,
                                  puntaje:  
                                      queryActivitie[0]['Puntaje'] as int     
                                  );
                            },
                          ).toList()));
                    },
                  ).toList()));
            },
          ).toList());

          return await lsGroups;
        }
      }

      await db.close();

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<void> saveGroupSubjects(List<Group> lsGroups) async {
    try {
      final db = await DbLocal.initDatabase();
      if (db.isOpen) {
        lsGroups.map(
          (e) async {
            await db.transaction(
              (txn) async {
                await txn.insert('tbGrupos', {
                  'GrupoId': e.grupoId,
                  'NombreGrupo': e.nombreGrupo,
                  'Descripcion': e.descripcion,
                  'CodigoAcceso': e.codigoAcceso,
                  'CodigoColor': e.codigoColor
                });
              },
            );

            int groupId = e.grupoId ?? 0;

            e.materias?.map(
              (e) async {
                await db.insert('tbMaterias', {
                  'MateriaId': e.materiaId,
                  'NombreMateria': e.nombreMateria,
                  'Descripcion': e.descripcion,
                  'CodigoColor': e.codigoColor,
                  'CodigoAcceso': e.codigoAcceso
                });

                await db.insert('tbGruposMaterias',
                    {'GrupoId': groupId, 'MateriaId': e.materiaId});

                int subjectId = e.materiaId;

                e.actividades?.map(
                  (e) async {
                    await db.insert('tbActividades', {
                      'ActividadId': e.actividadId,
                      'NombreActividad': e.nombreActividad,
                      'Descripcion': e.descripcion,
                      'FechaCreacion': e.fechaCreacion,
                      'FechaLimite': e.fechaLimite,
                      'MateriaId': subjectId
                    });

                    await db.insert('tbMateriasActividades',
                        {'MateriaId': subjectId, 'ActividadId': e.actividadId});
                  },
                );
              },
            );
          },
        );
      }
      await db.close();
    } catch (e) {
      print(e);
    }
  }
}
