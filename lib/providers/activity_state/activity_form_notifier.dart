import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activity_form_state.dart';
import 'package:aprende_mas/views/widgets/inputs/generic_input.dart';

class ActivityFormNotifier extends StateNotifier<ActivityFormState> {
  ActivityFormNotifier() : super(ActivityFormState());

  // Actualiza el campo 'nombre'
  onNombreChanged(String value) {
    final newNombre = GenericInput.dirty(value);
    state = state.copyWith(
      nombre: newNombre,
      isValid: Formz.validate([
        newNombre,
        state.descripcion,
        state.horaLimite,
        state.fechaLimite,
      ]),
    );
  }

  // Actualiza el campo 'descripcion'
  onDescripcionChanged(String value) {
    final newDescripcion = GenericInput.dirty(value);
    print('Nombre actualizado: $newDescripcion');
    state = state.copyWith(
      descripcion: newDescripcion,
      isValid: Formz.validate([
        state.nombre,
        newDescripcion,
        state.horaLimite,
        state.fechaLimite,
      ]),
    );
  }

  // Actualiza el campo 'fechaEntrega'
  onFechaEntregaChanged(String value) {
    final newHoraLimite = GenericInput.dirty(value);
    state = state.copyWith(
      horaLimite: newHoraLimite,
      isValid: Formz.validate([
        state.nombre,
        state.descripcion,
        newHoraLimite,
        state.fechaLimite,
      ]),
    );
  }

  // Actualiza el campo 'horaEntrega'
  onHoraEntregaChanged(String value) {
    final newFechaLimite = GenericInput.dirty(value);
    state = state.copyWith(
      fechaLimite: newFechaLimite,
      isValid: Formz.validate([
        state.nombre,
        state.descripcion,
        state.horaLimite,
        newFechaLimite,
      ]),
    );
  }

  onFormSubmit() {
    _touchEveryField();

    if (!state.isValid) return;

    print(state);
  }

  _touchEveryField() {
    final nombre = GenericInput.dirty(state.nombre.value);
    final descripcion = GenericInput.dirty(state.descripcion.value);
    final horaLimite = GenericInput.dirty(state.horaLimite.value);
    final fechaLimite = GenericInput.dirty(state.fechaLimite.value);

    state = state.copyWith(
        isFormPosted: true,
        nombre: nombre,
        descripcion: descripcion,
        horaLimite: horaLimite,
        fechaLimite: fechaLimite,
        isValid:
            Formz.validate([nombre, descripcion, horaLimite, fechaLimite]));
  }
}