import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/models/models.dart';

class ActivityState {
  final List<Activity> activities; // Lista de actividades cargadas
  final bool isLoading; // Indica si las actividades están cargándose
  final String? errorMessage; // Mensaje de error en caso de fallo
  final String answer;
  final List<Submission> lsSubmissions;

  ActivityState(
      {this.activities = const [],
      this.isLoading = false,
      this.errorMessage,
      this.lsSubmissions = const [],
      this.answer = ""});

  ActivityState copyWith(
      {List<Activity>? activities,
      bool? isLoading,
      String? errorMessage,
      String? answer,
      List<Submission>? lsSubmissions}) {
    return ActivityState(
        activities: activities ?? this.activities,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        answer: answer ?? this.answer,
        lsSubmissions: lsSubmissions ?? this.lsSubmissions);
  }
}
