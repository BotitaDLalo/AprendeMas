import 'package:aprende_mas/views/widgets/forms/form_login.dart';
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
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  
                  Text(
                    'Inicia sesión', style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //?Llamar al  FormLogin
                  FormLogin(),

                  Text('¿Olvidaste tu contraseña?', style: Theme.of(context).textTheme.bodySmall,),

                  //todo: button
                  const SizedBox(
                    height: 15,
                  ),

                  Text('No tienes cuenta',style: Theme.of(context).textTheme.bodySmall,),

                  //todo: button
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
