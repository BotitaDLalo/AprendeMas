import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/inputs/color_input.dart';

class FormEventState {
  final List<Event> events;
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final GenericInput title;
  final GenericInput description;
  final GenericInput startDate;
  final GenericInput startTime;
  final GenericInput endDate;
  final GenericInput endTime;
  // final Color pickerColor; 
  final ColorInput colorCode;
  final List<int>? groupIds;
  final List<int>? subjectIds; 

  FormEventState({
    this.events = const [],
    this.isPosting = false, 
    this.isFormPosted = false,
    this.isValid = false,
    this.title = const GenericInput.pure(),
    this.description = const GenericInput.pure(),
    this.startDate = const GenericInput.pure(),
    this.startTime = const GenericInput.pure(),
    this.endDate = const GenericInput.pure(),
    this.endTime = const GenericInput.pure(),
    this.colorCode = const ColorInput.pure(),
    // this.pickerColor = const Color.fromARGB(0, 255, 255, 255),
    this.groupIds = const [],
    this.subjectIds = const []
  });

  FormEventState copyWith({
    List<Event>? events,
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    GenericInput? title,
    GenericInput? description,
    GenericInput? startDate,
    GenericInput? startTime,
    GenericInput? endDate, 
    GenericInput? endTime,
    // Color? pickerColor,
    ColorInput? colorCode,
    List<int>? groupIds,
    List<int>? subjectIds,
  }) => FormEventState(
    events: events ?? this.events,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isPosting:  isPosting ?? this.isPosting,
    isValid: isValid ?? this.isValid,
    title:  title ?? this.title,
    description: description ?? this.description,
    startDate: startDate ?? this.startDate,
    startTime: startTime ?? this.startTime,
    endDate: endDate ?? this.endDate,
    endTime: endTime ?? this.endTime,
    // pickerColor: pickerColor ?? this.pickerColor,
    colorCode: colorCode ?? this.colorCode,
    groupIds: groupIds ?? this.groupIds,
    subjectIds: subjectIds ?? this.subjectIds
  );
}