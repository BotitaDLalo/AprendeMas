import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/notices/notices_state.dart';
import 'package:aprende_mas/providers/notices/notices_state_notifier.dart';
import 'package:aprende_mas/providers/notifications/notifications_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/notices_repository_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/notices/notices_repository.dart';

final noticesProvider = StateNotifierProvider<NoticesStateNotifier, NoticesState>((ref) {
  final noticesRepository = NoticesRepositoryImpl();
  return NoticesStateNotifier(noticesRepository: noticesRepository);
},);