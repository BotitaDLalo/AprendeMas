import 'dart:ui';

import 'package:aprende_mas/views/infrastructure/inputs.dart';

import '../../views/infrastructure/color_input.dart';

class FormSubjectsState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final GenericInput subjectName;
  final GenericInput description;
  final ColorInput colorCode;
  final Color pickerColor;

  FormSubjectsState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.subjectName = const GenericInput.pure(),
    this.description = const GenericInput.pure(),
    this.colorCode = const ColorInput.pure(),
    this.pickerColor = const Color.fromARGB(0, 255, 255, 255),
  });

  FormSubjectsState copyWith(
          {bool? isPosting,
          bool? isFormPosted,
          bool? isValid,
          GenericInput? subjectName,
          GenericInput? description,
          ColorInput? colorCode,
          Color? pickerColor}) =>
      FormSubjectsState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          subjectName: subjectName ?? this.subjectName,
          description: description ?? this.description,
          colorCode: colorCode ?? this.colorCode,
          pickerColor: pickerColor ?? this.pickerColor
          );
}
