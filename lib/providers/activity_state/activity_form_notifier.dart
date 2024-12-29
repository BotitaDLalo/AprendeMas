import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activity_form_state.dart';
import 'package:aprende_mas/views/widgets/inputs/generic_input.dart';
import 'package:aprende_mas/views/inputs/time_input.dart';

class ActivityFormNotifier extends StateNotifier<ActivityFormState> {
  final Function(int, String, String, DateTime) activityCallback;
  // late int? materiaId;
  final TextEditingController nombreController;
  final TextEditingController descripcionController;
  final TextEditingController fechaController;
  final TextEditingController horaController;

  ActivityFormNotifier({required this.activityCallback})
      : fechaController = TextEditingController(),
        horaController = TextEditingController(),
        nombreController = TextEditingController(),
        descripcionController = TextEditingController(),
        super(ActivityFormState());

  // void setMateriaId(int materiaId) {
  //   this.materiaId = materiaId;
  // }

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
  onFechaLimiteChanged(DateTime value) {
    final newHoraLimite = TimeInput.dirty(value);
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
  onHoraLimiteChanged(DateTime value) {
    final newFechaLimite = TimeInput.dirty(value);
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

  DateTime? _getFechaHoraConcatenada() {
    try {
      // Verificar que la fecha no sea nula.
      final fecha = state.fechaLimite.value;
      if (fecha == null) {
        throw Exception("La fecha es nula");
      }

      // Verificar que la hora no sea nula.
      final hora = state.horaLimite.value;
      if (hora == null) {
        throw Exception("La hora es nula");
      }

      // Combinar fecha y hora en un objeto DateTime.
      return DateTime(
        fecha.year,
        fecha.month,
        fecha.day,
        hora.hour,
        hora.minute,
      );
    } catch (e) {
      print("Error al concatenar fecha y hora: $e");
      return null; // Retorna null si hay un error.
    }
  }

  onFormSubmit(int subjectId) async {
    _touchEveryField();

    if (!state.isValid) return; // Detener si el formulario no es válido.

    // Realizar la concatenación de fecha y hora.
    final fechaHoraConcatenada = _getFechaHoraConcatenada();
    if (fechaHoraConcatenada == null) {
      // Manejar el caso en que la concatenación falle, si es necesario.
      print("Error: Fecha u hora inválida.");
      return;
    }

    state = state.copyWith(isPosting: true);

    // Llamar el callback con los valores requeridos.
    await activityCallback(
      subjectId,
      state.nombre.value,
      state.descripcion.value,
      fechaHoraConcatenada,
    );

    state = state.copyWith(isPosting: false);
    resetStateForm();
    print(" onFormSubmit : $state");
  }

  _touchEveryField() {
    final nombre = GenericInput.dirty(state.nombre.value);
    final descripcion = GenericInput.dirty(state.descripcion.value);
    final horaLimite = TimeInput.dirty(state.horaLimite.value);
    final fechaLimite = TimeInput.dirty(state.fechaLimite.value);

    state = state.copyWith(
        isFormPosted: true,
        nombre: nombre,
        descripcion: descripcion,
        horaLimite: horaLimite,
        fechaLimite: fechaLimite,
        isValid:
            Formz.validate([nombre, descripcion, horaLimite, fechaLimite]));
  }

  resetStateForm() {
    nombreController.clear();
    descripcionController.clear();
    fechaController.clear();
    horaController.clear();
    state = ActivityFormState();
    print("Formulario reseteado: $state");
  }
}
