import 'package:aprende_mas/models/models.dart';

class AuthUserMapper {
  static AuthUser userJsonToEntity(Map<String, dynamic> user) => AuthUser(
    id: user['id'],
      nombre: user['nombre'],
      email: user['correo'],
      rol: user['rol'],
      token: user['token']);
}
