import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final Icon? icon;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(dynamic)? onChanged;
  final FormFieldValidator? validator;
  final bool capitalizeFirstLetter;
  final double? customHeight;

  const CustomDropdown({
    super.key,
    this.icon,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.capitalizeFirstLetter = false,
    this.customHeight,
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);

    return DropdownButtonFormField(
      validator: validator,
      style: const TextStyle(fontSize: 20, color: Colors.black),
      items: items.map((user) {
        return DropdownMenuItem<String>(
          value: user,
          child: Text(
            user,
            style: const TextStyle(fontSize: 20),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: icon,
        floatingLabelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(100, 0, 0, 0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade800),
          // borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade800),
          // borderRadius: BorderRadius.circular(15),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primaryColor,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 8, vertical: customHeight ?? 15),
      ),
    );
  }
}
