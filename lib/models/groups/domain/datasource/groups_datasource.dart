import 'package:aprende_mas/models/groups/domain/entity/groups.dart';

abstract class GroupsDatasource {
  Future<List<Groups>> getGroup(String group);
  Future<Groups> createUpdateGroup(Map<String, dynamic> gruopNew);
}
