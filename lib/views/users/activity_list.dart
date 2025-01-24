import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/providers/activity_state/activity_provider.dart';
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
  @override
  void initState() {
    super.initState();
    // Cargar actividades al inicializar el widget
    Future.microtask(() {
      ref.read(activityProvider.notifier).getAllActivities(widget.subjectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref.watch(activityProvider);
    final cn = CatalogNames();
    final kvs = KeyValueStorageServiceImpl();
    if (activityState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (activityState.errorMessage != null) {
      return _ErrorMessage(message: activityState.errorMessage!);
    }

    if (activityState.activities.isEmpty) {
      return const _EmptyMessage(message: 'No hay actividades disponibles.');
    }

    void teacherActivitySettings(Activity activity) {
      context.push('/teacher-activity-settings', extra: activity);
    }

    void studentActivitySectionSubmissions(Activity activity) {
      context.push('/student-activity-section-submissions', extra: activity);
    }

    return ListView.builder(
      itemCount: activityState.activities.length,
      itemBuilder: (context, index) {
        final activity = activityState.activities[index];
        // return ActivityBodyModel(
        //   nombreActividad: activity.nombreActividad,
        //   fechaCreacion: activity.fechaCreacion,
        //   fechaLimite: activity.fechaLimite,
        //   descripcion: activity.descripcion,
        //   subjectId: activity.materiaId,
        // );

        return ElementTile(
            icon: const Icon(Icons.assignment, color: Colors.black),
            title: activity.nombreActividad,
            subtitle: activity.fechaLimite.toString(),
            trailing: '',
            onTapFunction: () async {
              final role = await kvs.getRole();
              final activityData = Activity(
                  actividadId: activity.actividadId,
                  nombreActividad: activity.nombreActividad,
                  descripcion: activity.descripcion,
                  tipoActividadId: activity.tipoActividadId,
                  fechaCreacion: activity.fechaCreacion,
                  fechaLimite: activity.fechaLimite,
                  materiaId: activity.materiaId);
              if (role == cn.getRoleTeacherName) {
                teacherActivitySettings(activityData);
              } else if (role == cn.getRoleStudentName) {
                studentActivitySectionSubmissions(activityData);
              }
            });
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
