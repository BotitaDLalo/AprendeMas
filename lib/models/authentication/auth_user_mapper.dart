import 'package:aprende_mas/models/models.dart';

class AuthUserMapper {
  static AuthUser userJsonToEntity(Map<String, dynamic> user) => AuthUser(
        userId: user['Id'] ?? -1,
        userName: user['UserName'] ?? "",
        email: user['Correo'] ?? "",
        role: user['Rol'] ?? "",
        token: user['Token'] ?? "",
        estaAutorizado: user['EstaAutorizado'] ?? "",
        requiereDatosAdicionales: user['RequiereDatosAdicionales'] ?? false,
      );
}
