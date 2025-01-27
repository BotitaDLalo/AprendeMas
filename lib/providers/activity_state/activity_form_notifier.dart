import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activity_form_state.dart';
import 'package:aprende_mas/views/widgets/inputs/generic_input.dart';
// import 'package:aprende_mas/views/widgets/inputs/time_input.dart';

class ActivityFormNotifier extends StateNotifier<ActivityFormState> {
  final Function(int, String, String, DateTime, int) activityCallback;
  final TextEditingController nombreController;
  final TextEditingController descripcionController;
  final TextEditingController fechaController;
  final TextEditingController horaController;
  final TextEditingController puntajeController;

  ActivityFormNotifier({required this.activityCallback})
      : fechaController = TextEditingController(),
        horaController = TextEditingController(),
        nombreController = TextEditingController(),
        descripcionController = TextEditingController(),
        puntajeController = TextEditingController(),
        super(ActivityFormState());

  onNombreChanged(String value) {
    final newNombre = GenericInput.dirty(value);
    state = state.copyWith(
      nombre: newNombre,
      isValid: Formz.validate([
        newNombre,
        state.descripcion,
        state.horaLimite,
        state.fechaLimite,
        state.puntaje
      ]),
    );
  }

  // Actualiza el campo 'descripcion'
  onDescripcionChanged(String value) {
    print("onDescripcionChanged llamado con valor: $value");

    final newDescripcion = GenericInput.dirty(value);

    state = state.copyWith(
      descripcion: newDescripcion,
      isValid: Formz.validate([
        state.nombre,
        newDescripcion,
        state.fechaLimite,
        state.horaLimite,
        state.puntaje,
      ]),
    );

    print("Nuevo estado de descripción: ${state.descripcion.value}");
  }

  // Actualiza el campo 'fechaEntrega'
  onFechaLimiteChanged(String value) {
    final newFechaLimite = GenericInput.dirty(value);
    state = state.copyWith(
      fechaLimite: newFechaLimite, // Corregido: Asigna a 'fechaLimite'
      isValid: Formz.validate([
        state.nombre,
        state.descripcion,
        state.horaLimite,
        newFechaLimite, // Valida correctamente 'fechaLimite'
        state.puntaje
      ]),
    );
  }

  // Actualiza el campo 'horaEntrega'
  onHoraLimiteChanged(String value) {
    final newHoraLimite = GenericInput.dirty(value);
    state = state.copyWith(
      horaLimite: newHoraLimite, // Corregido: Asigna a 'horaLimite'
      isValid: Formz.validate([
        state.nombre,
        state.descripcion,
        state.fechaLimite,
        newHoraLimite, // Valida correctamente 'horaLimite'
        state.puntaje
      ]),
    );
  }

  onPuntajeChanged(String value) {
    int? parsedValue = int.tryParse(value);
    final newPuntaje = GenericInput.dirty(
      parsedValue != null ? parsedValue.toString() : '',
    );
    state = state.copyWith(
      puntaje: newPuntaje,
      isValid: Formz.validate([
        state.nombre,
        state.descripcion,
        state.fechaLimite,
        state.horaLimite,
        newPuntaje,
      ]),
    );
  }

  DateTime? _getFechaHoraConcatenada() {
    try {
      // Obtener y parsear la fecha
      final fechaStr = state.fechaLimite.value;
      if (fechaStr.isEmpty) {
        throw Exception("La fecha es nula o está vacía");
      }
      final fecha = DateTime.tryParse(fechaStr);
      if (fecha == null) {
        throw Exception("Formato de fecha inválido: $fechaStr");
      }

      // Obtener y parsear la hora
      final horaStr = state.horaLimite.value;
      if (horaStr.isEmpty) {
        throw Exception("La hora es nula o está vacía");
      }
      final horaParts = horaStr.split(':');
      if (horaParts.length != 2) {
        throw Exception("Formato de hora inválido: $horaStr");
      }
      final hora = int.tryParse(horaParts[0]) ?? 0;
      final minuto = int.tryParse(horaParts[1]) ?? 0;

      // Combinar fecha y hora en un objeto DateTime
      return DateTime(
        fecha.year,
        fecha.month,
        fecha.day,
        hora,
        minuto,
      );
    } catch (e) {
      return null; // Retorna null si hay un error
    }
  }

  Future<void> onFormSubmit(int subjectId, String nombreMateria) async {
    if (state.isPosting) return;

    _touchEveryField();

    final fechaHoraConcatenada = _getFechaHoraConcatenada();
    if (fechaHoraConcatenada == null) {
      throw Exception("onFormSubmit Error: Fecha u hora inválida.");
    }

    // Validar que el puntaje sea convertible a entero
    final puntajeInt = int.tryParse(state.puntaje.value);
    if (puntajeInt == null) {
      throw Exception("onFormSubmit Error: Puntaje inválido.");
    }

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    try {
      bool res = await activityCallback(
        subjectId,
        state.nombre.value,
        state.descripcion.value,
        fechaHoraConcatenada,
        puntajeInt, // Pasar el puntaje como entero
      );
      state = state.copyWith(isFormPosted: res);
    } catch (e) {
      throw Exception("Error durante la petición: $e");
    } finally {
      state = state.copyWith(isPosting: false);
      if (state.isFormPosted) {
        resetStateForm();
      }
    }
  }

  _touchEveryField() {
    final nombre = GenericInput.dirty(state.nombre.value);
    final descripcion = GenericInput.dirty(state.descripcion.value);
    final fechaLimite = GenericInput.dirty(state.fechaLimite.value);
    final horaLimite = GenericInput.dirty(state.horaLimite.value);
    final puntaje = GenericInput.dirty(state.puntaje.value);

    print("Descripción: ${descripcion.value}, válida: ${descripcion.isValid}");

    state = state.copyWith(
        isFormPosted: true,
        nombre: nombre,
        descripcion: descripcion,
        fechaLimite: fechaLimite,
        horaLimite: horaLimite,
        puntaje: puntaje,
        isValid: Formz.validate(
            [nombre, descripcion, fechaLimite, horaLimite, puntaje]));
  }

  void resetStateForm() {
    nombreController.clear();
    descripcionController.clear();
    fechaController.clear();
    horaController.clear();
    puntajeController.clear();
    state = ActivityFormState();
    print("Formulario reseteado: $state");
  }
}
