import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity/activity_form_state.dart';
import 'package:aprende_mas/views/widgets/inputs/generic_input.dart';
// import 'package:aprende_mas/views/widgets/inputs/time_input.dart';

class ActivityFormNotifier extends StateNotifier<ActivityFormState> {
  final Function(int, String, String, DateTime, int) activityCallback;
  final Function(int, String) sendSubmissionCallback;
  final TextEditingController nombreController;
  final TextEditingController descripcionController;
  final TextEditingController fechaController;
  final TextEditingController horaController;
  final TextEditingController answerController;
  final TextEditingController puntajeController;

  ActivityFormNotifier({
    required this.activityCallback,
    required this.sendSubmissionCallback,
  })  : fechaController = TextEditingController(),
        horaController = TextEditingController(),
        nombreController = TextEditingController(),
        descripcionController = TextEditingController(),
        answerController = TextEditingController(),
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
    final newDescripcion = GenericInput.dirty(value);
    state = state.copyWith(
      descripcion: newDescripcion,
      isValid: Formz.validate([
        state.nombre,
        newDescripcion,
        state.horaLimite,
        state.fechaLimite,
        state.puntaje
      ]),
    );
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
    // Verificar que no haya una petición en curso
    if (state.isPosting) return;

    _touchEveryField();

    // Concatenar fecha y hora
    final fechaHoraConcatenada = _getFechaHoraConcatenada();
    if (fechaHoraConcatenada == null) {
      throw Exception("onFormSubmit Error: Fecha u hora inválida.");
    }

    final puntajeInt = int.tryParse(state.puntaje.value);
    if (puntajeInt == null) {
      throw Exception("onFormSubmit Error: Puntaje inválido.");
    }

    // Validar el formulario
    if (!state.isValid) return;

    // Marcar el inicio de la petición
    state = state.copyWith(isPosting: true);

    try {
      // Llamar al callback y obtener el resultado
      bool res = await activityCallback(
        subjectId,
        state.nombre.value,
        state.descripcion.value,
        fechaHoraConcatenada,
        puntajeInt
      );

      // Actualizar el estado según el resultado
      state = state.copyWith(isFormPosted: res);
    } catch (e) {
      throw Exception("Error durante la petición: $e");
    } finally {
      // Marcar el fin de la petición y resetear el formulario si fue exitoso
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

    state = state.copyWith(
        isFormPosted: true,
        nombre: nombre,
        descripcion: descripcion,
        fechaLimite: fechaLimite,
        horaLimite: horaLimite,
        puntaje: puntaje,
        isValid:
            Formz.validate([nombre, descripcion, fechaLimite, horaLimite, puntaje]));
  }

  void resetStateForm() {
    nombreController.clear();
    descripcionController.clear();
    fechaController.clear();
    horaController.clear();
    puntajeController.clear();
    state = ActivityFormState();
    debugPrint("Formulario reseteado: $state");
  }

  onAnswerChanged(String answer) {
    state = state.copyWith(answer: answer);
    debugPrint("CONTENIDO DEL CAMPO");
    debugPrint(state.answer);
  }

  onHasSubmission() async {
    state = state.copyWith(existsAnswer: true);
  }

  onSendSubmission(int activityId) async {
    bool submissionSent =
        await sendSubmissionCallback(activityId, state.answer);
    if (submissionSent) {
      dropAnswer();
    }
  }

  dropAnswer() {
    state = state.copyWith(existsAnswer: false, answer: "");
  }
}
