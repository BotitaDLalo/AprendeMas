import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/providers/activity/activity_provider.dart';
import 'package:aprende_mas/views/widgets/cards/activity_body_model.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:aprende_mas/config/data/data.dart';

class ActivityList extends ConsumerStatefulWidget {
  final int subjectId;
  const ActivityList({super.key, required this.subjectId});

  @override
  ConsumerState<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends ConsumerState<ActivityList> {
  final cn = CatalogNames();
  final kvs = KeyValueStorageServiceImpl();
  late String role = "";

  @override
  void initState() {
    getRole();
    Future.microtask(
      () {
        ref.read(activityProvider.notifier).clearSubmissionData();
      },
    );
    super.initState();
  }

  void getRole() async {
    role = await kvs.getRole();
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref
        .watch(activityProvider.notifier)
        .getActivitiesBySubject(widget.subjectId);
    // final activityState = ref.watch(activityProvider);
    // if (activityState.isLoading) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    // if (activityState.errorMessage != null) {
    //   return _ErrorMessage(message: activityState.errorMessage!);
    // }

    // if (activityState.activities.isEmpty) {
    //   return const _EmptyMessage(message: 'No hay actividades disponibles.');
    // }

    void teacherActivityStudentsSubmissions(Activity activity) {
      context.push('/teacher-activities-students-options', extra: activity);
    }

    void studentActivitySubmissions(Activity activity) {
      context.push('/student-activity-section-submissions', extra: activity);
    }

    void showModalBottomActivityOptions() {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Editar'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete_forever),
                  title: const Text('Eliminar'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return ListView.builder(
      itemCount: activityState.length,
      itemBuilder: (context, index) {
        final activity = activityState[index];
        return GestureDetector(
          onLongPress: () async {
            if (role == cn.getRoleTeacherName) {
              showModalBottomActivityOptions();
            }
          },
          child: ElementTile(
              icon: Icons.assignment,
              iconSize: 28,
              iconColor: Colors.white,
              title: activity.nombreActividad,
              subtitle: activity.fechaLimite.toString(),
              onTapFunction: () async {
                final activityData = Activity(
                    actividadId: activity.actividadId,
                    nombreActividad: activity.nombreActividad,
                    descripcion: activity.descripcion,
                    tipoActividadId: activity.tipoActividadId,
                    fechaCreacion: activity.fechaCreacion,
                    fechaLimite: activity.fechaLimite,
                    materiaId: activity.materiaId,
                    puntaje: activity.puntaje);
                if (role == cn.getRoleTeacherName) {
                  teacherActivityStudentsSubmissions(activityData);
                } else if (role == cn.getRoleStudentName) {
                  studentActivitySubmissions(activityData);
                }
              }),
        );
      },
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  final String message;

  const _ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $message',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

class _EmptyMessage extends StatelessWidget {
  final String message;

  const _EmptyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
