import 'package:aprende_mas/models/models.dart';

class SubjectsState {
  final List<Subject> lsSubjects;

  SubjectsState({
    this.lsSubjects = const [],
  });

  SubjectsState copyWith({
    List<Subject>? lsSubjects,
  }) =>
      SubjectsState(
        lsSubjects: lsSubjects ?? this.lsSubjects,
      );
}
