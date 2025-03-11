import 'package:aprende_mas/views/views.dart';

class FormConfirmationCodeState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isFormNotPosted;
  final bool isValid;
  final GenericInput codeField1;
  final GenericInput codeField2;
  final GenericInput codeField3;
  final GenericInput codeField4;
  final GenericInput codeField5;

  FormConfirmationCodeState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isFormNotPosted = false,
    this.isValid = false,
    this.codeField1 = const GenericInput.pure(),
    this.codeField2 = const GenericInput.pure(),
    this.codeField3 = const GenericInput.pure(),
    this.codeField4 = const GenericInput.pure(),
    this.codeField5 = const GenericInput.pure(),
  });


  FormConfirmationCodeState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isFormNotPosted,
    bool? isValid,
    GenericInput? codeField1,
    GenericInput? codeField2,
    GenericInput? codeField3,
    GenericInput? codeField4,
    GenericInput? codeField5,
  }) =>
      FormConfirmationCodeState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isFormNotPosted: isFormNotPosted ?? this.isFormNotPosted,
        isValid: isValid ?? this.isValid,
        codeField1: codeField1 ?? this.codeField1,
        codeField2: codeField2 ?? this.codeField2,
        codeField3: codeField3 ?? this.codeField3,
        codeField4: codeField4 ?? this.codeField4,
        codeField5: codeField5 ?? this.codeField5,
      );
}
