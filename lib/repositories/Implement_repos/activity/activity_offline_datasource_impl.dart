import 'package:aprende_mas/repositories/Interface_repos/activity/activity_offline_datasource.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/config/data/db_local.dart';
import 'package:aprende_mas/config/data/key_value_storage_service_impl.dart';

class ActivityOfflineDatasourceImpl implements ActivityOfflineDatasource {
  final storageService = KeyValueStorageServiceImpl();
  @override
  Future<List<Activity>> getAllActivitiesOffline(int subjectId) async {
    try {
      final db = await DbLocal.initDatabase();
      if (db.isOpen) {
        final querylsActivitiesId = await db.query('tbMateriasActividades',
            columns: ['ActividadId'],
            where: '"MateriaId" = ?',
            whereArgs: [subjectId]);

        final lsActivitiesId = querylsActivitiesId
            .map(
              (e) => e['ActividadId'] as int,
            )
            .toList();

        final placeholders = List.filled(lsActivitiesId.length, '?').join(',');

        String query =
            "SELECT * FROM tbActividades WHERE ActividadId IN ($placeholders)";

        final querylsActivities = await db.rawQuery(query, lsActivitiesId);

        final lsActivities = Activity.queryToEntityActivity(querylsActivities);

        return lsActivities;
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> saveSubmissions(
      List<Submission> lsSubmissions, int activityId) async {
    try {
      final db = await DbLocal.initDatabase();
      if (db.isOpen) {
        final id = await storageService.getId();

        for (var sub in lsSubmissions) {
          int tbId = await db.transaction(
            (txn) async {
              return await txn.insert('tbAlumnosActividades', {
                'ActividadId': activityId,
                'AlumnoId': id,
                'FechaEntrega': sub.submissionDate,
                'EstatusEntrega': sub.status
              });
            },
          );

          await db.insert('tbEntregableActividades',
              {'AlumnoActividadId': tbId, 'Respuesta': sub.answer});
        }
      }

      await db.close();
    } catch (e) {
      print(e);
    } finally {
      final db = await DbLocal.initDatabase();
      await db.close();
    }
  }

  @override
  Future<List<Submission>> getSubmissionsOffline(int activityId) async {
    try {
      final db = await DbLocal.initDatabase();
      if (db.isOpen) {
        List<Submission> lsSubmisions = [];
        final querylsStudentActivities = await db.query('tbAlumnosActividades',
            columns: ['AlumnoActividadId', 'FechaEntrega', 'EstatusEntrega'],
            where: '"ActividadId" = ?',
            whereArgs: [activityId]);

        for (var sa in querylsStudentActivities) {
          int studentActivityId = sa['AlumnoActividadId'] as int;
          String submissionDate = sa['FechaEntrega'] as String;
          bool status = sa['EstatusEntrega'] == 1 ? true : false;

          final querylsSubmissions = await db.query('tbEntregableActividades',
              columns: ['Respuesta'],
              where: '"AlumnoActividadId" = ?',
              whereArgs: [studentActivityId]);

          for (var sub in querylsSubmissions) {
            Submission submission = Submission(
                studentActivityId: studentActivityId,
                status: status,
                submissionDate: submissionDate);
            if (sub['Respuesta'] != null) {
              submission.answer = sub['Respuesta'] as String;
            }
            if (sub['Enlace'] != null) {
              submission.answer = sub['Enlace'] as String;
            }
            if (sub['Archivo'] != null) {
              submission.answer = sub['Archivo'] as String;
            }
            submission.activityId = activityId;
            lsSubmisions.add(submission);
          }
        }

        await db.close();
        return lsSubmisions;
      }
      return [];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Future<List<Submission>> sendSubmissionOffline(
      int activityId, String answer) async {
    try {
      final db = await DbLocal.initDatabase();

      if (db.isOpen) {
        DateTime dateNow = DateTime.now();
        final id = await storageService.getId();
        await db.transaction(
          (txn) async {
            int tbId = await txn.insert('tbAlumnosActividades', {
              'ActividadId': activityId,
              'AlumnoId': id,
              'FechaEntrega': dateNow.toString(),
              'EstatusEntrega': false,
            });

            await txn.insert('tbEntregableActividades', {
              'AlumnoActividadId': tbId,
              'Respuesta': answer,
            });
          },
        );

        List<Submission> lsSubmisions = [];
        final querylsStudentActivities = await db.query('tbAlumnosActividades',
            columns: ['AlumnoActividadId', 'FechaEntrega', 'EstatusEntrega'],
            where: '"ActividadId" = ? AND "EstatusEntrega"=?',
            whereArgs: [activityId, 0]);

        for (var sa in querylsStudentActivities) {
          int studentActivityId = sa['AlumnoActividadId'] as int;
          String submissionDate = sa['FechaEntrega'] as String;
          bool status = sa['EstatusEntrega'] == 1 ? true : false;

          final querylsSubmissions = await db.query('tbEntregableActividades',
              columns: ['Respuesta'],
              where: '"AlumnoActividadId" = ?',
              whereArgs: [studentActivityId]);

          for (var sub in querylsSubmissions) {
            Submission submission = Submission(
                studentActivityId: studentActivityId,
                status: status,
                submissionDate: submissionDate);
            if (sub['Respuesta'] != null) {
              submission.answer = sub['Respuesta'] as String;
            }
            if (sub['Enlace'] != null) {
              submission.answer = sub['Enlace'] as String;
            }
            if (sub['Archivo'] != null) {
              submission.answer = sub['Archivo'] as String;
            }
            submission.activityId = activityId;
            lsSubmisions.add(submission);
          }
        }

        await db.close();

        //TODO: RETORNA EL LIST SUBMISSION
        return lsSubmisions;
      }
      return [];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  
  @override
  Future<List<Submission>> getSubmissionsPending(int activityId) async{
    try {
      final db = await DbLocal.initDatabase();
      if (db.isOpen) {
        List<Submission> lsSubmisions = [];
        final querylsStudentActivities = await db.query('tbAlumnosActividades',
            columns: ['AlumnoActividadId', 'FechaEntrega', 'EstatusEntrega'],
            where: '"ActividadId" = ? AND "EstatusEntrega"=?',
            whereArgs: [activityId, 0]);

        for (var sa in querylsStudentActivities) {
          int studentActivityId = sa['AlumnoActividadId'] as int;
          String submissionDate = sa['FechaEntrega'] as String;
          bool status = sa['EstatusEntrega'] == 1 ? true : false;

          final querylsSubmissions = await db.query('tbEntregableActividades',
              columns: ['Respuesta'],
              where: '"AlumnoActividadId" = ?',
              whereArgs: [studentActivityId]);

          for (var sub in querylsSubmissions) {
            Submission submission = Submission(
                studentActivityId: studentActivityId,
                status: status,
                submissionDate: submissionDate);
            if (sub['Respuesta'] != null) {
              submission.answer = sub['Respuesta'] as String;
            }
            if (sub['Enlace'] != null) {
              submission.answer = sub['Enlace'] as String;
            }
            if (sub['Archivo'] != null) {
              submission.answer = sub['Archivo'] as String;
            }
            submission.activityId = activityId;
            lsSubmisions.add(submission);
          }
        }

        await db.close();
        return lsSubmisions;
      }
      return [];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
