import 'package:flutter/material.dart';

class CustomTimeFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isDateField;
  final bool isTimeField;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTimeFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.isDateField = false,
    this.isTimeField = false,
  });

  @override
  CustomTimeFormFieldState createState() => CustomTimeFormFieldState();
}

class CustomTimeFormFieldState extends State<CustomTimeFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
      _controller.text = formattedDate; // Mostrar la fecha en el campo
      widget.onChanged?.call(formattedDate);
      setState(() {}); // Actualiza el estado para que el validator se ejecute nuevamente
    }
  }

Future<void> _selectTime(BuildContext context) async {
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null) {
    // Formato de 24 horas
    final formattedTime = pickedTime.format(context); // Obtiene la hora en formato 12 horas
    final time24Hour = _convertTo24HourFormat(formattedTime); // Convierte a formato 24 horas
    _controller.text = time24Hour; // Muestra la hora en el campo
    widget.onChanged?.call(time24Hour);
    setState(() {}); // Actualiza el estado para que el validator se ejecute nuevamente
  }
}

String _convertTo24HourFormat(String time12Hour) {
  final timeParts = time12Hour.split(' '); // Separa la hora y el AM/PM
  final time = timeParts[0]; // Hora sin AM/PM
  final period = timeParts[1]; // AM o PM

  final hourMinute = time.split(':');
  int hour = int.parse(hourMinute[0]);
  final minute = hourMinute[1];

  if (period == 'PM' && hour != 12) {
    hour += 12; // Si es PM y la hora no es 12, sumamos 12
  } else if (period == 'AM' && hour == 12) {
    hour = 0; // Si es AM y la hora es 12, restamos 12
  }

  return '${hour.toString().padLeft(2, '0')}:$minute'; // Regresa la hora en formato 24 horas
}


  void _handleTap() {
    if (widget.isDateField) {
      _selectDate(context);
    } else if (widget.isTimeField) {
      _selectTime(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);

    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    );

    return TextFormField(
      controller: _controller, // Controlador para actualizar el texto
      readOnly: true,
      onTap: _handleTap,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Este campo es obligatorio'; // Validación personalizada
        }
        return null; // Sin errores
      },
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      style: const TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: widget.label != null ? Text(widget.label!) : null,
        hintText: widget.hint,
        errorText: widget.errorMessage,
        focusColor: colors.primaryColor,
      ),
    );
  }
}
