import 'package:aprende_mas/models/models.dart';

class SubjectsState {
  final List<Subject> subjects;

  SubjectsState({
    this.subjects = const [],
  });

  SubjectsState copyWith({
    List<Subject>? subjects,
  }) =>
      SubjectsState(
        subjects: subjects ?? this.subjects,
      );
}
