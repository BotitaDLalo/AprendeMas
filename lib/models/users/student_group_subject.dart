class StudentGroupSubject {
  final String username;
  final String name;
  final String email;
  final String lastName;
  final String lastName2;

  StudentGroupSubject(
      {required this.username,
      required this.name,
      required this.email,
      required this.lastName,
      required this.lastName2});

  static List<StudentGroupSubject> studentGroupSubjectJsonToEntity(
      List<Map<String, dynamic>> studentGroupJson) {
    return studentGroupJson.map((json) {
      return StudentGroupSubject(
        email: json['email'] as String,
        username: json['userName'] as String,
        name: json['nombre'] as String,
        lastName: json['apellidoPaterno'] as String,
        lastName2: json['apellidoMaterno'] as String,
      );
    }).toList();
  }
}