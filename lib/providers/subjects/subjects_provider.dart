import 'package:aprende_mas/providers/subjects/subjects_state.dart';
import 'package:aprende_mas/providers/subjects/subjects_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/Implement_repos/subjects/subjects_respository_impl.dart';

final subjectsProvider =
    StateNotifierProvider.autoDispose<SubjectsStateNotifier, SubjectsState>((ref) {
  final subjectsRepository = SubjectsRespositoryImpl();
  return SubjectsStateNotifier(ref,subjectsRepository: subjectsRepository);
});
