import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    //?final colors = Theme.of(context).colorScheme;
    final colors = Colors.black; 

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors),
      borderRadius:  BorderRadius.circular(20),
    );
    
    return TextFormField(
      onChanged: (value) {
        print('value $value');
      },

      //todo: validator esta sujeto a camsbios por Riverpood
      validator: (value) {
        if (value == null) return 'Campo requerido';
        return  null;
      },

      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: Colors.purple)),
      ),
    );
  }
}

