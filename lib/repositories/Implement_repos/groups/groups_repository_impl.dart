import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/groups/groups.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups/groups_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_repository.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  final GroupsDataSource groupsDataSource;

  GroupsRepositoryImpl({GroupsDataSource? groupsDataSource})
      : groupsDataSource = groupsDataSource ?? GroupsDataSourceImpl();

  @override
  Future<List<Group>> getGroups() {
    return groupsDataSource.getGroups();
  }
  
  @override
  Future<List<Group>> createGroup(String nombreGrupo, String descripcion, Color codigoColor) {
    return groupsDataSource.createGroup(nombreGrupo, descripcion, codigoColor);
  }
  
  @override
  Future<void> deleteGroup() {
    // TODO: implement deleteGroup
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateGroup() {
    // TODO: implement updateGroup
    throw UnimplementedError();
  }
}
