import 'package:aprende_mas/models/authentication/user.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      roles: List<String>.from(json['roles'].map((role) => role)),
      token: json['token']);
}
