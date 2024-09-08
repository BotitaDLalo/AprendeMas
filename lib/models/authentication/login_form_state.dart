class LoginFormState {
  final String email;
  final String password;

  LoginFormState({required this.email, required this.password});

  LoginFormState copyWith({String? email, String? password}) {
    return LoginFormState(
        email: email ?? this.email, password: password ?? this.password);
  }
}