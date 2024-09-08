class FormState {
  final String email;
  final String password;

  FormState({required this.email, required this.password});

  FormState copyWith({String? email, String? password}) {
    return FormState(
        email: email ?? this.email, password: password ?? this.password);
  }
}