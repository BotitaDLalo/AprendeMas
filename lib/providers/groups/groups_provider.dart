import 'package:aprende_mas/providers/groups/groups_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'groups_state.dart';

final groupsProvider =
    StateNotifierProvider<GroupsNotifier, GroupsState>((ref) {
  final groupsRepository = GroupsRepositoryImpl();
  return GroupsNotifier(groupsRepository: groupsRepository);
});