import 'package:aprende_mas/views/views.dart';

class SigninFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isFormNotPosted;
  final bool isValid;
  final GenericInput name;
  final GenericInput lastName;
  final GenericInput secondLastName;
  final Email email;
  final Password password;
  final Role role;

  SigninFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isFormNotPosted = false,
      this.isValid = false,
      this.name = const GenericInput.pure(),
      this.lastName = const GenericInput.pure(),
      this.secondLastName = const GenericInput.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.role = const Role.pure()});

  SigninFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isFormNotPosted,
    bool? isValid,
    GenericInput? name,
    GenericInput? lastName,
    GenericInput? secondLastName,
    Email? email,
    Password? password,
    Role? role,
  }) =>
      SigninFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isFormNotPosted: isFormNotPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        secondLastName: secondLastName ?? this.secondLastName,
        email: email ?? this.email,
        password: password ?? this.password,
        role: role ?? this.role,
      );

  @override
  String toString() {
    return '''
        SiginFormState:
        isPosting: $isPosting
        isFormPosted: $isFormPosted
        isValid: $isValid
        name: $name
        lastName: $lastName
        secondLastName $secondLastName
        email: $email
        password: $password
        role: $role
''';
  }
}
