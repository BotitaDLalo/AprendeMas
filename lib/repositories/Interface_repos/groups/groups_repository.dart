
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/groups/groups.dart';

abstract class GroupsRepository {
  Future<List<Group>> getGroups();

  Future<List<Group>> createGroup(String nombreGrupo, String descripcion, Color codigoColor);

  Future<void> deleteGroup();

  Future<void> updateGroup();
}