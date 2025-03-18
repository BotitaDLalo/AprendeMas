import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups_subjects/groups_subjects_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups_subjects/groups_subjects_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups_subjects/groups_subjects_repository.dart';

class GroupsSubjectsRepositoryImpl implements GroupsSubjectsRepository {
  final GroupsSubjectsDataSource groupsSubjectsDataSource;

  GroupsSubjectsRepositoryImpl(
      {GroupsSubjectsDataSource? groupsSubjectsDataSource})
      : groupsSubjectsDataSource =
            groupsSubjectsDataSource ?? GroupsSubjectsDataSourceImpl();

  @override
  Future<JoinClass> joinClass(String codeClass) =>
      groupsSubjectsDataSource.joinClass(codeClass);
}
