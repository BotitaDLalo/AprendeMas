import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/providers/agenda/form_event_state.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/inputs/color_input.dart';

class FormUpdateEventNotifier extends StateNotifier<FormEventState>{
  final Function(Map<String, dynamic> eventLike)? updateEventCallback;

  FormUpdateEventNotifier({
    required this.updateEventCallback,
    required Event event
    })
    : super(FormEventState(
        title: GenericInput.dirty(event.title),
        description: GenericInput.dirty(event.description),
        startDate: GenericInput.dirty(event.startDate.toString()),
        startTime: GenericInput.dirty(event.startDate.toString()),
        endDate: GenericInput.dirty(event.endDate.toString()),
        endTime: GenericInput.dirty(event.endDate.toString()),
      ));

  onUpdateTitleChanged(String value) {
    state = state.copyWith(
      title: GenericInput.dirty(value),
      isValid: Formz.validate([
      GenericInput.dirty(value),
      GenericInput.dirty(state.description.value),
      ]) 
    );
  }

  onUpdateDescriptionChanged(String value) {
    state = state.copyWith(
      description:  GenericInput.dirty(value),
      isValid: Formz.validate([
      GenericInput.dirty(state.title.value),
      GenericInput.dirty(value),
      ])
    );
  }

  onUpdateStartDateChanged(String value) {
    final newStartDate = GenericInput.dirty(value);
    state = state.copyWith(
      startDate: newStartDate,
      isValid: Formz.validate([newStartDate])
    );
  } 

  onUpdateStartTimeChanged(String value) {
    final newStartTime = GenericInput.dirty(value);
    state = state.copyWith(
      startTime: newStartTime,
      isValid: Formz.validate([newStartTime])
    );
  } 
  
  onUpdateEndDateChanged(String value) {
    final newEndDate = GenericInput.dirty(value);
    state = state.copyWith(
      endDate: newEndDate,
      isValid: Formz.validate([newEndDate])
    );
  }

  onUpdateEndTimeChanged(String value) {
    final newEndtTime = GenericInput.dirty(value);
    state = state.copyWith(
      endTime: newEndtTime,
      isValid: Formz.validate([newEndtTime])
    );
  } 

  onUpdateGroupColorChanged(Color color) {
    final newColor = ColorInput.dirty(color);
    state = state.copyWith(
      pickerColor: color,
      colorCode: newColor,
      isValid: Formz.validate([newColor])
    );
  }

  void onUpdateGroupIdsChanged(List<int> ids) {
  state = state.copyWith(
    groupIds: ids, // Manteniendo el nombre original
    isValid: Formz.validate([]),
  );
}

void onUpdateSubjectIdsChanged(List<int> ids) {
  state = state.copyWith(
    subjectIds: ids, // Manteniendo el nombre original
    isValid: Formz.validate([]),
  );
}

DateTime? concatenarFechaHora(String fechaStr, String horaStr) {
  try {
    // Validar la fecha
    if (fechaStr.isEmpty) {
      throw Exception("La fecha es nula o está vacía");
    }
    final fecha = DateTime.tryParse(fechaStr);
    if (fecha == null) {
      throw Exception("Formato de fecha inválido: $fechaStr");
    }

    // Validar la hora
    if (horaStr.isEmpty) {
      throw Exception("La hora es nula o está vacía");
    }
    final horaParts = horaStr.split(':');
    if (horaParts.length != 2) {
      throw Exception("Formato de hora inválido: $horaStr");
    }
    final hora = int.tryParse(horaParts[0]) ?? 0;
    final minuto = int.tryParse(horaParts[1]) ?? 0;

    // Retornar la fecha y hora combinadas
    return DateTime(fecha.year, fecha.month, fecha.day, hora, minuto);
  } catch (e) {
    return null; // Retorna null si hay un error
  }
}

Future<void> onUpdateFormSubmit(int eventId) async {
  _updatetouchEveryField();
  if (!state.isValid) return;

  if (state.groupIds!.isEmpty && state.subjectIds!.isEmpty) {
    throw Exception("Debes seleccionar un grupo o una materia.");
  }

  // Obtener la fecha y hora concatenadas
  final fechaInicio = concatenarFechaHora(state.startDate.value, state.startTime.value);
  final fechaFinal = concatenarFechaHora(state.endDate.value, state.endTime.value);

  if (fechaInicio == null || fechaFinal == null) {
    throw Exception("Las fechas y horas no pueden ser nulas");
  }

  try {
    // updateEventCallback();
    state = state.copyWith(isPosting: true);
    state = state.copyWith(isFormPosted: false);
  } catch (e) {
    throw Exception("Error durante la petición: $e");
  } finally {
    // Marcar el fin de la petición y resetear el formulario si fue exitoso
    state = state.copyWith(isPosting: false);
  }
}
  
void _updatetouchEveryField() {
  final titleNameInput = GenericInput.dirty(state.title.value);
  final descriptionNameInput = GenericInput.dirty(state.description.value);
  final startDateNameInput = GenericInput.dirty(state.startDate.value);
  final startTimeNameInput = GenericInput.dirty(state.startTime.value);
  final endDate = GenericInput.dirty(state.endDate.value);
  final endTime = GenericInput.dirty(state.endTime.value);
  final colorCode = ColorInput.dirty(state.colorCode.value);

  final List<int> groups = List<int>.from(state.groupIds ?? []);
  final List<int> subjects = List<int>.from(state.subjectIds ?? []);

  // final bool isValidGroup = groups.isNotEmpty;
  // final bool isValidSubject = subjects.isNotEmpty;

  // if (!isValidGroup && !isValidSubject) {
  //   // Si ambos están vacíos, no es válido
  //   state = state.copyWith(
  //     title: title,
  //     description: description,
  //     startDate: startDate,
  //     startTime: startTime,
  //     endDate: endDate,
  //     endTime: endTime,
  //     colorCode: colorCode,
  //     groupIds: groups,
  //     subjectIds: subjects,
  //     isValid: false, // Indica que el formulario no es válido
  //   );
  //   return;
  // }

  state = state.copyWith(
    title: titleNameInput,
    description: descriptionNameInput,
    startDate: startDateNameInput,
    startTime: startTimeNameInput,
    endDate: endDate,
    endTime: endTime,
    colorCode: colorCode,
    groupIds: groups,
    subjectIds: subjects,
    isValid: Formz.validate([
      titleNameInput,
      descriptionNameInput,
      startDateNameInput,
      startTimeNameInput,
      endDate,
      endTime,
      colorCode,
    ]), 
  );
}

}