class AuthUser {
  final String nombre;
  final String email;
  final String rol;
  final String token;

  AuthUser(
      {required this.nombre,
      required this.email,
      required this.rol,
      required this.token});
}
