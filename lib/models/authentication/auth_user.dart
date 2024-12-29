class AuthUser {
  final int id;
  final String userName;
  final String email;
  final String rol;
  final String token;

  AuthUser(
      {required this.id,
      required this.userName,
      required this.email,
      required this.rol,
      required this.token});
}
