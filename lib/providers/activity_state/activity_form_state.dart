import 'package:aprende_mas/views/infrastructure/generic_input.dart';

class ActivityFormState {
  final bool isPosting; // Indica si se está enviando el formulario
  final bool isValid; // Indica si el formulario es válido
  final bool isFormPosted;
  final GenericInput nombre; // Validación del campo 'nombre'
  final GenericInput descripcion; // Validación del campo 'descripcion'
  final GenericInput horaLimite; // Validación del campo 'fechaEntrega'
  final GenericInput fechaLimite; // Validación del campo 'horaEntrega'

  ActivityFormState({
    this.isPosting = false,
    this.isValid = false,
    this.isFormPosted = false,
    this.nombre = const GenericInput.pure(),
    this.descripcion = const GenericInput.pure(),
    this.horaLimite = const GenericInput.pure(),
    this.fechaLimite = const GenericInput.pure(),
  });

  // Método para crear una nueva instancia con campos actualizados
  ActivityFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    GenericInput? nombre,
    GenericInput? descripcion,
    GenericInput? fechaLimite,
    GenericInput? horaLimite,
  }) =>
      ActivityFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          nombre: nombre ?? this.nombre,
          descripcion: descripcion ?? this.descripcion,
          horaLimite: horaLimite ?? this.horaLimite,
          fechaLimite: fechaLimite ?? this.fechaLimite);

  @override
  String toString() {
    return '''
  ActivityFormState: 
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    nombre: $nombre
    descripcion: $descripcion
    horaLimite: $horaLimite
    fechaLimite: $fechaLimite
    ''';
  }
}