import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/notices/notices_state_notifier.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/db_local_notices_repository_impl.dart';

final noticesProvider =
    StateNotifierProvider<NoticesStateNotifier, List<Notice>>(
  (ref) {
    final dbLocalNoticesRepository = DbLocalNoticesRepositoryImpl();
    return NoticesStateNotifier(
        dbLocalNoticesRepository: dbLocalNoticesRepository);
  },
);
