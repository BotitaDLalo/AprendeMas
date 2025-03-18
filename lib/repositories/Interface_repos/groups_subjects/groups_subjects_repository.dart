import '../../../models/models.dart';

abstract class GroupsSubjectsRepository {
  Future<JoinClass> joinClass(String codeClass);
}