class AuthUser {
  final int userId;
  final String userName;
  final String email;
  final String role;
  final String token;
  final String? estaAutorizado;
  final bool? requiereDatosAdicionales;

  AuthUser(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.role,
      required this.token,
      this.estaAutorizado,
      this.requiereDatosAdicionales});

  static AuthUser authUserVoid() =>
      AuthUser(userId: -1, userName: '', email: '', role: '', token: '');
}
