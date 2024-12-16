class AuthOfflineUser {
  final int usuarioId;
  final String nombreUsuario;
  final String correo;
  final String fechaLimiteActivo;
  AuthOfflineUser(
      {required this.usuarioId,
      required this.nombreUsuario,
      required this.correo,
      required this.fechaLimiteActivo});
  static AuthOfflineUser userOffilineJsonToEntity(
      List<Map<String, Object?>> lsUser) {
    Map<String, Object?> user = lsUser[0];

    return AuthOfflineUser(
        usuarioId: user['UsuarioId'] as int,
        nombreUsuario: user['NombreUsuario'] as String,
        correo: user['Correo'] as String,
        fechaLimiteActivo: user['FechaLimiteActivo'] as String);
  }
}
