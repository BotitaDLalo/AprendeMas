import 'package:aprende_mas/views/widgets/inputs/generic_input.dart';
import 'package:aprende_mas/views/inputs/time_input.dart';

class ActivityFormState {
  final bool isPosting; // Indica si se está enviando el formulario
  final bool isFormPosted;
  final bool isValid; // Indica si el formulario es válido
  final GenericInput nombre; // Validación del campo 'nombre'
  final GenericInput descripcion; // Validación del campo 'descripcion'
  final TimeInput fechaLimite;
  final TimeInput horaLimite;

  ActivityFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.nombre = const GenericInput.pure(),
    this.descripcion = const GenericInput.pure(),
    this.fechaLimite = const TimeInput.pure(),
    this.horaLimite = const TimeInput.pure()
  });

  // Método para crear una nueva instancia con campos actualizados
  ActivityFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    GenericInput? nombre,
    GenericInput? descripcion,
    TimeInput? fechaLimite,
    TimeInput? horaLimite,
  }) =>
      ActivityFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          nombre: nombre ?? this.nombre,
          descripcion: descripcion ?? this.descripcion,
          fechaLimite: fechaLimite ?? this.fechaLimite,
          horaLimite:  horaLimite ?? this.horaLimite
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
    ''';
  }
}