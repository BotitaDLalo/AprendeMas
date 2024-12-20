import 'package:aprende_mas/config/utils/packages.dart';

enum ColorInputError { withoutChoosing }

class ColorInput extends FormzInput<Color, ColorInputError> {
  const ColorInput.pure() : super.pure(Colors.white);
  const ColorInput.dirty(super.color) : super.dirty();

  String? get errorMessage {
    if (displayError == ColorInputError.withoutChoosing) return 'Debes elegir un color';
    return null;
  }

  @override
  ColorInputError? validator(Color value) {
    if (value == Colors.white) return ColorInputError.withoutChoosing;
    return null;
  }
}
