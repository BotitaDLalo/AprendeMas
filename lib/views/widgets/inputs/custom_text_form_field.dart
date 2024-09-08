import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    this.obscureText = false
    });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors),
      borderRadius:  BorderRadius.circular(20),
    );
    
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: Colors.blue)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label != null ? Text(label!): null,
        labelStyle: TextStyle(
          color: Colors.green
        ),
        hintText: hint,
        errorText: errorMessage, 
        focusColor: colors.primaryColor
      ),
    );
  }
}

