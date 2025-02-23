import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_offline_data_source.dart';
import 'package:aprende_mas/config/data/db_local.dart';
import 'package:aprende_mas/config/utils/general_utils.dart';

class GroupsOfflineDataSourceImpl implements GroupsOfflineDataSource {
  @override
  Future<List<Group>> getGroupsSubjects() async {
    try {
      final db = await DbLocal.initDatabase();

      if (db.isOpen) {
        final querylsGroups = await db.rawQuery('SELECT * FROM tbGrupos');

        if (querylsGroups.isNotEmpty) {
          List<Group> lsGroups = [];

          for (var groupRow in querylsGroups) {
            int groupId = groupRow['GrupoId'] as int;

            final querylsGroupsSubjectsId = await db.rawQuery(
                "SELECT MateriaId FROM tbGruposMaterias WHERE GrupoId = ?",
                [groupId]);

            List<Subject> materias = [];

            for (var subjectRow in querylsGroupsSubjectsId) {
              int subjectId = subjectRow['MateriaId'] as int;

              final querySubject = await db.rawQuery(
                  "SELECT * FROM tbMaterias WHERE MateriaId = ?", [subjectId]);

              final querylsActivitiesId = await db.rawQuery(
                  "SELECT ActividadId FROM tbMateriasActividades WHERE MateriaId = ?",
                  [subjectId]);

              List<Activity> actividades = [];

              for (var activityRow in querylsActivitiesId) {
                int activityId = activityRow['ActividadId'] as int;

                final queryActivitie = await db.rawQuery(
                    "SELECT * FROM tbActividades WHERE ActividadId = ?",
                    [activityId]);

                actividades.add(Activity(
                    actividadId: queryActivitie[0]['ActividadId'] as int,
                    nombreActividad:
                        queryActivitie[0]['NombreActividad'] as String,
                    descripcion: queryActivitie[0]['Descripcion'] as String,
                    tipoActividadId:
                        queryActivitie[0]['TipoActividadId'] as int,
                    fechaCreacion: formatDate(
                        queryActivitie[0]['FechaCreacion'] as String),
                    fechaLimite:
                        formatDate(queryActivitie[0]['FechaLimite'] as String),
                    materiaId: queryActivitie[0]['MateriaId'] as int,
                    puntaje: queryActivitie[0]['Puntaje'] as int));
              }

              materias.add(Subject(
                materiaId: subjectId,
                nombreMateria: querySubject[0]['NombreMateria'] as String,
                descripcion: querySubject[0]['Descripcion'] as String,
                codigoAcceso: querySubject[0]['CodigoAcceso'] as String,
                actividades: actividades,
              ));
            }

            lsGroups.add(Group(
              grupoId: groupRow['GrupoId'] as int,
              nombreGrupo: groupRow['NombreGrupo'] as String,
              descripcion: groupRow['Descripcion'] as String,
              codigoAcceso: groupRow['CodigoAcceso'] as String,
              materias: materias,
            ));
          }

          await db.close();
          return lsGroups;
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
        for (var group in lsGroups) {
          await db.transaction(
            (txn) async {
              await txn.insert('tbGrupos', {
                'GrupoId': group.grupoId,
                'NombreGrupo': group.nombreGrupo,
                'Descripcion': group.descripcion,
                'CodigoAcceso': group.codigoAcceso
              });
            },
          );

          int groupId = group.grupoId ?? 0;

          if (group.materias != null) {
            for (var subject in group.materias!) {
              await db.insert('tbMaterias', {
                'MateriaId': subject.materiaId,
                'NombreMateria': subject.nombreMateria,
                'Descripcion': subject.descripcion,
                'CodigoAcceso': subject.codigoAcceso
              });

              await db.insert('tbGruposMaterias',
                  {'GrupoId': groupId, 'MateriaId': subject.materiaId});

              int subjectId = subject.materiaId;

              if (subject.actividades != null) {
                for (var activity in subject.actividades!) {
                  await db.insert('tbActividades', {
                    'ActividadId': activity.actividadId,
                    'NombreActividad': activity.nombreActividad,
                    'TipoActividadId': activity.tipoActividadId,
                    'Descripcion': activity.descripcion,
                    'FechaCreacion': activity.fechaCreacion.toString(),
                    'FechaLimite': activity.fechaLimite.toString(),
                    'MateriaId': subjectId,
                    'Puntaje': activity.puntaje
                  });

                  await db.insert('tbMateriasActividades', {
                    'MateriaId': subjectId,
                    'ActividadId': activity.actividadId
                  });
                }
              }
            }
          }
        }
        await db.close();
      }
    } catch (e) {
      print(e);
    }
  }
}
