import 'package:aprende_mas/models/models.dart';

class AuthUserMapper {
  static AuthUser userJsonToEntity(Map<String, dynamic> user) => AuthUser(
      id: user['id'] ?? -1,
      userName: user['userName'],
      email: user['correo'],
      rol: user['rol'] ?? "",
      token: user['token']);
}
