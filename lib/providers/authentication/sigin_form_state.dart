import 'package:aprende_mas/views/views.dart';

class SiginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final GenericInput name;
  final GenericInput lastName;
  final GenericInput secondLastName;
  final Email email;
  final Password password;
  final Role role;

  SiginFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.name = const GenericInput.pure(),
      this.lastName = const GenericInput.pure(),
      this.secondLastName = const GenericInput.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.role = const Role.pure()});

  SiginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    GenericInput? name,
    GenericInput? lastName,
    GenericInput? secondLastName,
    Email? email,
    Password? password,
    Role? role,
  }) =>
      SiginFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
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