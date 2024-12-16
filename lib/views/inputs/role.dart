import 'package:formz/formz.dart';

enum RoleError { empty }

class Role extends FormzInput<String, RoleError> {
  const Role.pure() : super.pure('');

  const Role.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == RoleError.empty) return 'El campo es requerido';

    return null;
  }

  @override
  RoleError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return RoleError.empty;
    return null;
  }
}
