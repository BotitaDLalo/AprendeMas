import 'package:aprende_mas/models/groups/group.dart';

class GroupMapper {
  static Group empty() => Group(
      grupoId: -1,
      descripcion: '',
      nombreGrupo: '',
      codigoAcceso: '',
      codigoColor: '');

  static Group groupToEntity(Map<String, dynamic> group) => Group(
      grupoId: group['grupoId'],
      nombreGrupo: group['nombreGrupo'],
      descripcion: group['descripcion'],
      codigoAcceso: group['codigoAcceso'],
      codigoColor: group['codigoColor']);
}
