import 'package:aprende_mas/models/models.dart';

class GroupsSubjectsState {
  final JoinClass? joinClass;
  final String errorMessage;

  GroupsSubjectsState({this.joinClass, this.errorMessage = ""});

  GroupsSubjectsState copyWith({JoinClass? joinClass, String? errorMessage}) =>
      GroupsSubjectsState(
          joinClass: joinClass ?? this.joinClass,
          errorMessage: errorMessage ?? this.errorMessage);
}
