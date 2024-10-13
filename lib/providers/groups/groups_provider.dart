import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/groups/groups_state_notifier.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../views/shared/local_data_groups.dart';

// Proveedor para grupos
final groupsProvider =
    StateNotifierProvider<GroupsNotifier, List<Group>>((ref) {
  final groupsRepository = GroupsRepositoryImpl();

  return GroupsNotifier(groupsRepository: groupsRepository);
});
