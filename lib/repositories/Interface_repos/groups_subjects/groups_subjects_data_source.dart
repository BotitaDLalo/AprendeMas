import 'package:aprende_mas/models/models.dart';

abstract class GroupsSubjectsDataSource {
  Future<JoinClass> joinClass(String codeClass);
}
