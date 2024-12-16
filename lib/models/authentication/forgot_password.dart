class ForgotPassword {
  final String email;

  ForgotPassword({required this.email});

  ForgotPassword copyWith(String? email){
    return ForgotPassword(email: email ?? this.email);
  }
}