import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormForgotPassword extends ConsumerWidget {
  const FormForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 350,
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: const Alignment(-0.8, 1),
            child: Text(
              '¿Olvidaste tu contraseña?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Correo',
            // textEditingController: loginFormNotifier.emailController,
            keyboardType: TextInputType.emailAddress,
            // onChanged: loginFormNotifier.onEmailChanged,
            // errorMessage: loginForm.isFormPosted ? loginForm.email.errorMessage : null,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonForm(buttonName: "Enviar", onPressed: () {
            //TODO: Logica para recuperacion de password
            context.pop();
          })
        ],
      ),
    );
  }
}
