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

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);

    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(15),
    );

    return TextFormField(
      controller: textEditingController,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      // cursorColor: Colors.black,
      style: const TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          enabledBorder: border.copyWith(
              borderSide:
                  const BorderSide(color: Color.fromARGB(100, 0, 0, 0))),
          focusedBorder: border.copyWith(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hint,
          errorText: errorMessage,
          focusColor: colors.primaryColor),
    );
  }
}
