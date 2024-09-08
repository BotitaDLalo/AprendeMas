import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormLogin extends ConsumerWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef) {
    return const Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Correo',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}


