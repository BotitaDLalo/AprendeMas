import 'package:aprende_mas/models/groups/groups.dart';

abstract class GroupDataSource {
  Future <List<Groups>> getGroups(String name, String accesCode);
}

