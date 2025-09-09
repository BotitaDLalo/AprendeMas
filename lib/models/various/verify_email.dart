class VerifyEmail {
  final String email;
  final bool isEmailValid;

  VerifyEmail({required this.email, required this.isEmailValid});

  static verifyEmailToEntity(Map<String, dynamic> json, bool isValid) {
    return VerifyEmail(email: json['Email'], isEmailValid: isValid);
  }
}
