import 'package:aprende_mas/models/models.dart';

class AuthUserMapper {
  static AuthUser userJsonToEntity(Map<String, dynamic> user) => AuthUser(
        userId: user['id'] ?? -1,
        userName: user['userName'] ?? "",
        email: user['correo'] ?? "",
        role: user['rol'] ?? "",
        token: user['token'] ?? "",
        estaAutorizado: user['estaAutorizado'] ?? "",
        requiereDatosAdicionales: user['requiereDatosAdicionales'] ?? false,
      );
}
