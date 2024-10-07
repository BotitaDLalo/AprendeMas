import 'package:aprende_mas/models/models.dart';

class AuthUserMapper {
  static AuthUser userJsonToEntity(Map<String, dynamic> json) => AuthUser(
      nombre: json['nombre'],
      email: json['correo'],
      rol: json['rol'],
      token: json['token']);
}
