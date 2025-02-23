import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/models/models.dart';

class ActivityState {
  final List<Activity> activities; // Lista de actividades cargadas
  final bool isLoading; // Indica si las actividades están cargándose
  final String? errorMessage; // Mensaje de error en caso de fallo
  final String answer;
  final int grade;
  final List<Submission> lsSubmissions;

  ActivityState(
      {this.activities = const [],
      this.isLoading = false,
      this.grade = 0,
      this.errorMessage,
      this.lsSubmissions = const [],
      this.answer = ""});

  ActivityState copyWith(
      {List<Activity>? activities,
      bool? isLoading,
      String? errorMessage,
      String? answer,
      int? grade,
      List<Submission>? lsSubmissions}) {
    return ActivityState(
        activities: activities ?? this.activities,
        grade: grade ?? this.grade,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        answer: answer ?? this.answer,
        lsSubmissions: lsSubmissions ?? this.lsSubmissions);
  }
}
