import 'package:aprende_mas/views/widgets/inputs/email.dart';

class FormEmailState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isFormNotPosted;
  final bool isValid;
  final Email email;

  FormEmailState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isFormNotPosted = false,
      this.isValid = false,
      this.email = const Email.pure()});

  FormEmailState copyWith(
          {bool? isPosting,
          bool? isFormPosted,
          bool? isFormNotPosted,
          bool? isValid,
          Email? email}) =>
      FormEmailState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isFormNotPosted: isFormNotPosted ?? this.isFormNotPosted,
          isValid: isValid ?? this.isValid,
          email: email ?? this.email);
}
