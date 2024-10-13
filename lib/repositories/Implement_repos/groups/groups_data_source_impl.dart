
import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/models/groups/groups.dart';
import 'package:aprende_mas/models/groups/groups_mapper/groups_mapper.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups/groups_data_source.dart';

class GroupsDataSourceImpl implements GroupsDataSource{
  @override
  Future<List<Group>> getGroups() async{
    const uri = "/Grupo";
    try {
      final  res = await dio.get(uri);
      final resLista = List<Map<String, dynamic>>.from(res.data);
      final groups =  GroupsMapper.groupsJsonToEntityList(resLista);

      return groups;
    } catch (e) {
      throw Exception(e);
    }
  }
  
}