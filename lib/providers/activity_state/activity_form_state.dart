import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/views/widgets/inputs/generic_input.dart';
// import 'package:aprende_mas/views/widgets/inputs/hour_input.dart';
// import 'package:aprende_mas/views/widgets/inputs/time_input.dart';

class ActivityFormState {
  final List<Activity> activities;
  final bool isPosting; // Indica si se está enviando el formulario
  final bool isFormPosted;
  final bool isValid; // Indica si el formulario es válido
  final GenericInput nombre; // Validación del campo 'nombre'
  final GenericInput descripcion; // Validación del campo 'descripcion'
  final GenericInput fechaLimite;
  final GenericInput horaLimite;
  final GenericInput puntaje;

  ActivityFormState({
    this.activities = const [],
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.nombre = const GenericInput.pure(),
    this.descripcion = const GenericInput.pure(),
    this.fechaLimite = const GenericInput.pure(),
    this.horaLimite = const GenericInput.pure(),
    this.puntaje = const GenericInput.pure()
  });

  // Método para crear una nueva instancia con campos actualizados
  ActivityFormState copyWith({
    List<Activity>? activities,
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    GenericInput? nombre,
    GenericInput? descripcion,
    GenericInput? fechaLimite,
    GenericInput? horaLimite,
    GenericInput? puntaje
  }) =>
      ActivityFormState(
          activities: activities ?? this.activities,
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          nombre: nombre ?? this.nombre,
          descripcion: descripcion ?? this.descripcion,
          fechaLimite: fechaLimite ?? this.fechaLimite,
          horaLimite:  horaLimite ?? this.horaLimite,
          puntaje: puntaje ?? this.puntaje
      );

  @override
  String toString() {
    return '''
  ActivityFormState: 
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    nombre: $nombre
    descripcion: $descripcion
    fechaLimite: $fechaLimite
    horaLimite: $horaLimite
    puntaje: $puntaje
    ''';
  }
}