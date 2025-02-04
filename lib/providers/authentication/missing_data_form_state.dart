import 'package:aprende_mas/views/views.dart';

class MissingDataFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final GenericInput names;
  final GenericInput lastName;
  final GenericInput secondLastName;
  final Role role;

  MissingDataFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.names = const GenericInput.pure(),
      this.lastName = const GenericInput.pure(),
      this.secondLastName = const GenericInput.pure(),
      this.role = const Role.pure()});

  MissingDataFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    GenericInput? names,
    GenericInput? lastName,
    GenericInput? secondLastName,
    Role? role,
  }) =>
      MissingDataFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        names: names ?? this.names,
        lastName: lastName ?? this.lastName,
        secondLastName: secondLastName ?? this.secondLastName,
        role: role ?? this.role,
      );
}
