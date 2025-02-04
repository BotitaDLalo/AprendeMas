import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/notices/firebase_cm_state_notifier.dart';
import 'package:aprende_mas/providers/notices/firebase_cm_state.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/db_local_notices_repository_impl.dart';

final firebasecmProvider = StateNotifierProvider<FirebasecmStateNotifier, FirebasecmState>(
  (ref) {
    final noticesRepositoryImpl = DbLocalNoticesRepositoryImpl();

    return FirebasecmStateNotifier(noticesRepositoryImpl: noticesRepositoryImpl);
  },
);
