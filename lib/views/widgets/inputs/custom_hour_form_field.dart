import 'package:flutter/material.dart';

class CustomHourFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isDateField;
  final bool isTimeField;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomHourFormField({
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
  CustomHourFormFieldState createState() => CustomHourFormFieldState();
}

class CustomHourFormFieldState extends State<CustomHourFormField> {
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
      String formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
      _controller.text = formattedDate; // Mostrar la fecha en el campo
      widget.onChanged?.call(formattedDate);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final formattedTime = pickedTime.format(context);
      _controller.text = formattedTime; // Mostrar la hora en el campo
      widget.onChanged?.call(formattedTime);
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
      readOnly: widget.isDateField || widget.isTimeField,
      onTap: () {
        if (widget.isDateField) {
          _selectDate(context);
        } else if (widget.isTimeField) {
          _selectTime(context);
        }
      },
      validator: widget.validator,
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

