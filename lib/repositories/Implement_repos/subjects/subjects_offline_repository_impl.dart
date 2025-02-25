import 'package:aprende_mas/models/subjects/subjects.dart';
import 'package:aprende_mas/repositories/Implement_repos/subjects/subjects_offline_data_source_impl.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_offline_data_source.dart';
import 'package:aprende_mas/repositories/Interface_repos/subjects/subjects_offline_repository.dart';

class SubjectsOfflineRepositoryImpl implements SubjectsOfflineRepository {
  SubjectsOfflineDataSource subjectsOfflineDataSource;

  SubjectsOfflineRepositoryImpl(
      {SubjectsOfflineDataSource? subjectsOfflineDataSource})
      : subjectsOfflineDataSource =
            subjectsOfflineDataSource ?? SubjectsOfflineDataSourceImpl();

  @override
  Future<List<Subject>> getSujectsWithoutGroup() {
    return subjectsOfflineDataSource.getSujectsWithoutGroup();
  }

  @override
  Future<void> saveSubjectsWithoutGroup(List<Subject> lsSubjectsWithoutGroup) {
    return subjectsOfflineDataSource
        .saveSubjectsWithoutGroup(lsSubjectsWithoutGroup);
  }
}
