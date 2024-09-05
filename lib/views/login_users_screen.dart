import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginUsersScreen extends StatelessWidget {
  const LoginUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              //todo: cambiar el color
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text('Inicia sesión',),
                  const SizedBox(height: 10,),
                  _RegisterForm(),

                  Text('¿Olvidaste tu contraseña?'),

                  //todo: button
                  const SizedBox(height: 15,),

                  Text('No tienes cuenta'),

                  //todo: button
                  const SizedBox(height: 15,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomTextFormField(), 
            const SizedBox(height: 10,),
            CustomTextFormField(),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}


