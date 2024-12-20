import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/views/widgets/inputs/color_input.dart';
import 'package:aprende_mas/views/widgets/inputs/inputs.dart';

class FormGroupsState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final int groupId;
  final GenericInput groupName;
  final GenericInput description;
  final ColorInput colorCode;
  final Color pickerColor;
  final int subjectIndex;
  final GenericInput subjectName;
  final GenericInput subjectDescription;
  final List<SubjectsRow> subjectsRow;
  final String email;
  final VerifyEmail? verifyEmail;

  FormGroupsState({
    this.groupId = -1,
    this.subjectIndex = -1,
    this.subjectsRow = const [],
    this.subjectName = const GenericInput.pure(),
    this.subjectDescription = const GenericInput.pure(),
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.groupName = const GenericInput.pure(),
    this.description = const GenericInput.pure(),
    this.colorCode = const ColorInput.pure(),
    this.pickerColor = const Color.fromARGB(0, 255, 255, 255),
    this.email = '',
    this.verifyEmail,
  });

  FormGroupsState copyWith(
          {bool? isPosting,
          bool? isFormPosted,
          bool? isValid,
          GenericInput? groupName,
          GenericInput? description,
          ColorInput? colorCode,
          Color? pickerColor,
          int? subjectId,
          int? groupId,
          GenericInput? subjectName,
          GenericInput? subjectDescription,
          List<SubjectsRow>? subjectsRow,
          int? subjectIndex,
          String? email,
          VerifyEmail? verifyEmail}) =>
      FormGroupsState(
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isPosting: isPosting ?? this.isPosting,
          isValid: isValid ?? this.isValid,
          groupName: groupName ?? this.groupName,
          description: description ?? this.description,
          colorCode: colorCode ?? this.colorCode,
          pickerColor: pickerColor ?? this.pickerColor,
          groupId: groupId ?? this.groupId,
          subjectName: subjectName ?? this.subjectName,
          subjectDescription: subjectDescription ?? this.subjectDescription,
          subjectsRow: subjectsRow ?? this.subjectsRow,
          subjectIndex: subjectIndex ?? this.subjectIndex,
          email: email ?? this.email,
          verifyEmail: verifyEmail ?? this.verifyEmail);
}
