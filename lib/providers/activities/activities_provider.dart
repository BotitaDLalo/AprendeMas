import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/activities/activities_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activitiesProvider =
    StateNotifierProvider<ActivitiesStateNotifier, List<Activities>>((ref) {
  return ActivitiesStateNotifier(ref);
});
