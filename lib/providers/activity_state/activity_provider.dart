import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activity_state.dart';
import 'package:aprende_mas/providers/activity_state/activity_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/activity/activity_repository_impl.dart';

final activityRepositoryProvider = Provider<ActivityRepositoryImpl>((ref) {
  return ActivityRepositoryImpl();
});

// Proveedor del StateNotifier para el estado de actividades
final activityProvider =
    StateNotifierProvider<ActivityNotifier, ActivityState>((ref) {
  final repository = ref.watch(activityRepositoryProvider);
  return ActivityNotifier(activityRepository: repository);
});

