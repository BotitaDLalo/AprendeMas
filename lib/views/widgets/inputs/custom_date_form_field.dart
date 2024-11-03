import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Necesario para el formato de fecha

class CustomDateFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isDateField; // Nueva propiedad para definir si es un campo de fecha
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomDateFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.isDateField = false, // Se inicializa como false por defecto
    this.keyboardType = TextInputType.text,
  });

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(pickedDate); // Formateo de la fecha
      onChanged?.call(controller.text); // Llamada a onChanged si existe
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    final controller = TextEditingController();

    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    );

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: isDateField ? TextInputType.none : keyboardType, // Desactiva teclado si es fecha
      readOnly: isDateField, // Campo solo lectura si es fecha
      style: const TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        suffixIcon: isDateField ? Icon(Icons.calendar_today, color: Colors.black) : null,
        focusColor: colors.primaryColor,
      ),
      onTap: isDateField
          ? () => _selectDate(context, controller) // Llama al selector de fecha
          : null,
    );
  }
}
