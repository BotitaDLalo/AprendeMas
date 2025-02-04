class AuthOfflineUser {
  final int userId;
  final String userName;
  final String email;
  final String role;
  final String activeDueDate;
  AuthOfflineUser(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.role,
      required this.activeDueDate});
  static AuthOfflineUser userOffilineJsonToEntity(
      List<Map<String, Object?>> lsUser) {
    Map<String, Object?> user = lsUser[0];

    return AuthOfflineUser(
        userId: user['UsuarioId'] as int,
        userName: user['NombreUsuario'] as String,
        email: user['Correo'] as String,
        role: user['Rol'] as String,
        activeDueDate: user['FechaLimiteActivo'] as String);
  }
}
