import 'package:aprende_mas/models/models.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      nombre: json['nombre'],
      email: json['correo'],
      rol: json['rol'].toString(),
      token: json['token']);
}
