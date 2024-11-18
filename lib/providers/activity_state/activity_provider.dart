import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activity_state.dart';
import 'package:aprende_mas/providers/activity_state/activity_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/activity/activity_repository_impl.dart';


// Proveedor del repositorio de actividades

final activityRepositoryProvider = Provider<ActivityRepositoryImpl>((ref) {
  return ActivityRepositoryImpl();
});

// Proveedor del StateNotifier para el estado de actividades
final activityProvider =
    StateNotifierProvider<ActivityStateNotifier, ActivityState>((ref) {
  final repository = ref.watch(activityRepositoryProvider);
  return ActivityStateNotifier(repository: repository);
});
