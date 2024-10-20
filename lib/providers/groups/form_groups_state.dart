import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/infrastructure/color_input.dart';
import 'package:aprende_mas/views/infrastructure/inputs.dart';

class FormGroupsState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final GenericInput groupName;
  final GenericInput description;
  final ColorInput colorCode;
  final Color pickerColor;

  FormGroupsState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.groupName = const GenericInput.pure(),
      this.description = const GenericInput.pure(),
      this.colorCode = const ColorInput.pure(),
      // this.pickerColor = const Color.fromARGB(0, 255, 255, 255),
      this.pickerColor = const Color.fromARGB(0, 255, 255, 255),
      
      });

  FormGroupsState copyWith(
          {bool? isPosting,
          bool? isFormPosted,
          bool? isValid,
          GenericInput? groupName,
          GenericInput? description,
          ColorInput? colorCode,
          Color? pickerColor,}) =>
      FormGroupsState(
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isPosting: isPosting ?? this.isPosting,
          isValid: isValid ?? this.isValid,
          groupName: groupName ?? this.groupName,
          description: description ?? this.description,
          colorCode: colorCode ?? this.colorCode,
          pickerColor: pickerColor ?? this.pickerColor,);
}
