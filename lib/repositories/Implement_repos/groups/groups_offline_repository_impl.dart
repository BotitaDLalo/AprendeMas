import 'package:aprende_mas/models/groups/group.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_offline_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_offline_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_offline_repository.dart';

class GroupsOfflineRepositoryImpl implements GroupsOfflineRepository {
  final GroupsOfflineDataSource groupsOfflineDataSource;

  GroupsOfflineRepositoryImpl(
      {GroupsOfflineDataSource? groupsOfflineDataSource})
      : groupsOfflineDataSource =
            groupsOfflineDataSource ?? GroupsOfflineDataSourceImpl();

  @override
  Future<List<Group>> getGroupsSubjects() {
    return groupsOfflineDataSource.getGroupsSubjects();
  }
  
  @override
  Future<void> saveGroupSubjects(List<Group> lsGroups) {
    return groupsOfflineDataSource.saveGroupSubjects(lsGroups);
  }
}
