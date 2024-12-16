class AuthUser {
  final int id;
  final String nombre;
  final String email;
  final String rol;
  final String token;

  AuthUser(
      {required this.id,
      required this.nombre,
      required this.email,
      required this.rol,
      required this.token});
}
