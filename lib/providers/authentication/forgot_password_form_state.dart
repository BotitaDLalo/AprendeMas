import 'package:aprende_mas/views/views.dart';

class ForgotPasswordFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;

  ForgotPasswordFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure()});

  ForgotPasswordFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
  }) =>
      ForgotPasswordFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
      );

  @override
  String toString() {
    return '''
    LoginFormState:
      isPosting: $isPosting
      isFormPosted: $isFormPosted
      isValid: $isValid
      email: $email
''';
  }
}
