import 'package:formz/formz.dart';

enum GenericInputError { empty }

class GenericInput extends FormzInput<String, GenericInputError> {
  const GenericInput.pure() : super.pure('');

  const GenericInput.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == GenericInputError.empty) return 'El campo es requerido';

    return null;
  }

  @override
  GenericInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return GenericInputError.empty;
    return null;
  }
}
