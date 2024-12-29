import 'package:aprende_mas/config/utils/packages.dart';

enum TimeInputError { empty, invalid }

class TimeInput extends FormzInput<DateTime?, TimeInputError> {
  const TimeInput.pure() : super.pure(null);

  const TimeInput.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == TimeInputError.empty) return 'El campo es requerido';

    if (displayError == TimeInputError.invalid) return 'Fecha y hora inválida';

    return null;
  }

  @override
  TimeInputError? validator(DateTime? value) {
    if (value == null) return TimeInputError.empty;
    return null; // Es válido si no es nulo.
  }
}
