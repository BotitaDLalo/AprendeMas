import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/repositories/Implement_repos/groups_subjects/groups_subjects_repository_impl.dart';

final groupsSubjectsRepositoryImplProvider =
    Provider<GroupsSubjectsRepositoryImpl>(
  (ref) => GroupsSubjectsRepositoryImpl(),
);
