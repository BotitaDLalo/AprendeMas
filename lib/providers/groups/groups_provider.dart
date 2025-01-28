import 'package:aprende_mas/providers/groups/groups_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_offline_repository_impl.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'groups_state.dart';

final groupsProvider =
    StateNotifierProvider<GroupsNotifier, GroupsState>((ref) {
  final groupsRepository = GroupsRepositoryImpl();
  final groupsOfflineRepository = GroupsOfflineRepositoryImpl();
  return GroupsNotifier(
      groupsRepository: groupsRepository,
      groupsOfflineRepository: groupsOfflineRepository);
});
