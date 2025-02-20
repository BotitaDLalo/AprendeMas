import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/views.dart';

class NoticesFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final GenericInput title;
  final GenericInput description;

  NoticesFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.title = const GenericInput.pure(),
      this.description = const GenericInput.pure()});

  NoticesFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    GenericInput? title,
    GenericInput? description,
  }) =>
      NoticesFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          title: title ?? this.title,
          description: description ?? this.description);
}
