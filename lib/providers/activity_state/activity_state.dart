import 'package:aprende_mas/models/activities/activity/activity.dart';

class ActivityState {
  final List<Activity> activities; // Lista de actividades cargadas
  final bool isLoading; // Indica si las actividades están cargándose
  final String? errorMessage; // Mensaje de error en caso de fallo

  ActivityState({
    this.activities = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  ActivityState copyWith({
    List<Activity>? activities,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ActivityState(
      activities: activities ?? this.activities,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
