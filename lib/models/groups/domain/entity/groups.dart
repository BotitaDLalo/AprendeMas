import '../../../subjects/subjects.dart';

class Groups {
  final String name;
  final String accesCode;
  final String description;
  final List<Subjects> subject;

  Groups(
      {required this.name,
      required this.accesCode,
      required this.description,
      required this.subject});
}
