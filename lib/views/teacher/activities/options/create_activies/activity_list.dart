import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/providers/activity_state/activity_provider.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/activity_body.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/activity_body_molde.dart';


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
    print('ActivityList subjectId: ${widget.subjectId}');
    Future.microtask(() {
      ref.read(activityProvider.notifier).getAllActivities(widget.subjectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref.watch(activityProvider);

    if (activityState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (activityState.errorMessage != null) {
      return _ErrorMessage(message: activityState.errorMessage!);
    }

    if (activityState.activities.isEmpty) {
      return const _EmptyMessage(message: 'No hay actividades disponibles.');
    }

    return ListView.builder(
      itemCount: activityState.activities.length,
      itemBuilder: (context, index) {
        final activity = activityState.activities[index];
        return ActivityBodyModel(
          nombreActividad: activity.nombreActividad,
          fechaCreacion: activity.fechaCreacion,
          fechaLimite: activity.fechaLimite,
          descripcion: activity.descripcion,
          subjectId: activity.materiaId,
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

