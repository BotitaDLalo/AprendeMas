import 'package:aprende_mas/models/models.dart';

class JoinClass {
  final Group? group;
  final Subject? subject;
  final bool isGroup;

  JoinClass(
      {required this.group, required this.subject, required this.isGroup});

  static JoinClass resJsonToEntity(Map<String, dynamic> map) => JoinClass(
      group: map['grupo'] != null ? Group.mapToEntity(map['grupo']): null,
      subject: map['materia'] != null ? Subject.mapToEntity(map['materia']): null,
      isGroup: map['esGrupo'] as bool);
}
