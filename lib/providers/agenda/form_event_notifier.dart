import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/form_event_state.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/inputs/color_input.dart';

class FormEventNotifier extends StateNotifier<FormEventState>{
  final Function() eventCallback;
  final TextEditingController titleController; 
  final TextEditingController descriptionController;
  final TextEditingController startTimeController; 
  final TextEditingController startDateController;
  final TextEditingController endTimeController;
  final TextEditingController endDateController; 
  final TextEditingController colorController;  

  FormEventNotifier({required this.eventCallback})
    : titleController = TextEditingController(),
      descriptionController = TextEditingController(),
      startDateController = TextEditingController(),
      startTimeController = TextEditingController(),
      endDateController = TextEditingController(),
      endTimeController = TextEditingController(),
      colorController = TextEditingController(),
      super(FormEventState());

  onTitleChanged(String value) {
    final newTitle = GenericInput.dirty(value);
    state = state.copyWith(
      title: newTitle, 
      isValid: Formz.validate([
        newTitle, 
        state.description,
        state.startDate, 
        state.startTime,
        state.endDate,
        state.endTime,
        state.colorCode
      ])
    );
  }

  onDescriptionChanged(String value) {
      final newDescription = GenericInput.dirty(value);
      state.copyWith(
        description: newDescription,
        isValid: Formz.validate([
          state.title, 
          newDescription,
          state.startDate,
          state.startTime,
          state.endDate,
          state.endTime,
          state.colorCode
        ])
      );
    }

  onStartDateChanged(String value) {
    final newStartDate = GenericInput.dirty(value);
    state.copyWith(
      startDate: newStartDate,
      isValid: Formz.validate([
        state.title,
        state.description, 
        newStartDate,
        state.startTime,
        state.endDate,
        state.endTime,
        state.colorCode
      ])
    );
  }

  onStartTimeChanged(String value) {
    final newStartTime = GenericInput.dirty(value);
    state.copyWith(
      startTime: newStartTime,
      isValid: Formz.validate([
        state.title,
        state.description,
        state.startDate,
        newStartTime,
        state.endDate,
        state.endTime,
        state.colorCode
      ])
    );
  }

  onEndDatechanged(String value) {
    final newEndDate = GenericInput.dirty(value);
    state.copyWith(
      endDate: newEndDate,
      isValid: Formz.validate([
        state.title,
        state.description,
        state.startDate,
        state.startTime,
        newEndDate,
        state.endTime,
        state.colorCode
      ])
    );
  }

  onEndTimechanged(String value) {
    final newEndTime = GenericInput.dirty(value);
    state.copyWith(
      endDate: newEndTime,
      isValid: Formz.validate([
        state.title,
        state.description,
        state.startDate,
        state.startTime,
        state.endDate,
        newEndTime,
        state.colorCode
      ])
    );
  }

  onColorCodeChanged(Color color) {
    final newColorCode = ColorInput.dirty(color);
    state = state.copyWith(
        pickerColor: color,
        colorCode: newColorCode,
        isValid: Formz.validate([
          state.title,
          state.description,
          state.startDate,
          state.startTime,
          state.endDate,
          state.endTime,
          newColorCode
        ]));
  }

  onFormSubmit() {

  }  

  _touchEveryField() {
    final title = GenericInput.dirty(state.title.value);
    final description = GenericInput.dirty(state.description.value);
    final startDate = GenericInput.dirty(state.startDate.value);
    final startTime = GenericInput.dirty(state.startTime.value);
    final endDate = GenericInput.dirty(state.endDate.value);
    final endTime = GenericInput.dirty(state.endTime.value);
    final colorCode = ColorInput.dirty(state.colorCode.value);

    state = state.copyWith(
      title: title,
      description: description,
      startDate: startDate,
      startTime: startTime,
      endDate: endDate,
      endTime: endTime,
      colorCode: colorCode
    );
  }

  void resetStateForm() {
    titleController.clear();
    descriptionController.clear();
    startDateController.clear();
    startTimeController.clear();
    endDateController.clear();
    endTimeController.clear();
    colorController.clear();
  }

}
