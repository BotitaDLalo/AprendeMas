class User {
  final String nombre;
  final String email;
  final String rol;

  User({required this.nombre, required this.email, required this.rol});

  static User userVoid() => User(nombre: '', email: '', rol: '');
}
