import 'package:aprende_mas/providers/activity/activity_provider.dart';
import 'package:aprende_mas/providers/subjects/subjects_state.dart';
import 'package:aprende_mas/providers/subjects/subjects_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/activity/activity_offline_repository_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/subjects/subjects_offline_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/Implement_repos/subjects/subjects_respository_impl.dart';

final subjectsProvider =
    StateNotifierProvider<SubjectsStateNotifier, SubjectsState>((ref) {
  final subjectsRepository = SubjectsRespositoryImpl();

  final activityOffline = ActivityOfflineRepositoryImpl();
  final subjectsOffline = SubjectsOfflineRepositoryImpl();

  

  final getAllActivitiesCallback =
      ref.read(activityProvider.notifier).getAllActivities;

  final getSubmissionsCallback =
      ref.read(activityProvider.notifier).getSubmissions;

  return SubjectsStateNotifier(ref,
      subjectsOffline: subjectsOffline,
      subjectsRepository: subjectsRepository,
      activityOffline: activityOffline,
      getAllActivitiesCallback: getAllActivitiesCallback,
      getSubmissionsCallback: getSubmissionsCallback);
});
