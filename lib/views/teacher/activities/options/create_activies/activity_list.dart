import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activity_provider.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/activity_body.dart';

class ActivityList extends ConsumerWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesState = ref.watch(activityProvider);

    if (activitiesState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (activitiesState.errorMessage != null) {
      return Center(child: Text(activitiesState.errorMessage!));
    }

    return ListView.builder(
      shrinkWrap: true, // Ajusta el tamaño al contenido
      physics:
          const NeverScrollableScrollPhysics(), // Evita conflictos de scroll
      itemCount: activitiesState.activities.length,
      itemBuilder: (context, index) {
        final activity = activitiesState.activities[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ActivityBody(activity: activity),
        );
      },
    );
  }
}