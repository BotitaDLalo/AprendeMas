import 'package:aprende_mas/models/models.dart';

class UserSiginMapper {
  static UserSigin userSiginJsonToEntity(Map<String, dynamic> json) =>
      UserSigin(
          nombre: json['nombre'], email: json['correo'], rol: json['rol'].toString());
}
