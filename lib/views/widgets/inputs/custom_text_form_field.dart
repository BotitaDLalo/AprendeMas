import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final bool enableLineBreak; // Habilitación del salto de línea
  final bool capitalizeFirstLetter; // Capitalizar primera letra
  final double? customHeight; // Altura personalizada opcional

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textEditingController,
    this.enableLineBreak = false,  // Opcional
    this.capitalizeFirstLetter = false,  // Opcional
    this.customHeight, // Altura personalizada opcional
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);

    return TextFormField(
      controller: textEditingController,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: enableLineBreak ? null : 1, // Permite o no el salto de línea
      textCapitalization: capitalizeFirstLetter
          ? TextCapitalization.sentences
          : TextCapitalization.none, // Capitalización de la primera letra
      style: const TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(100, 0, 0, 0)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade800),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade800),
          borderRadius: BorderRadius.circular(15),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primaryColor,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 8, vertical: customHeight ?? 15), 
      ),
    );
  }
}

