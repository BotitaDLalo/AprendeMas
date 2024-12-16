import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/notices/fcm_state_notifier.dart';
import 'package:aprende_mas/providers/notices/fcm_state.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/db_local_notices_repository_impl.dart';

// final fcmProvider = Provider<FirebaseMessaging>((ref) => FirebaseMessaging.instance);

final fcmProvider = StateNotifierProvider<FcmStateNotifier, FcmState>(
  (ref) {
    final noticesRepositoryImpl = DbLocalNoticesRepositoryImpl();

    return FcmStateNotifier(noticesRepositoryImpl: noticesRepositoryImpl);
  },
);
