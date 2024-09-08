import 'package:aprende_mas/config/router/router.dart';
import 'package:aprende_mas/views/widgets/forms/form_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SingupUsersScreen extends StatelessWidget {
  const SingupUsersScreen({super.key});

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
                  
                  Container(
                    alignment: const Alignment(-0.8, 1),
                    child: Text(
                      'Registrate', style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),

                  //?Llamar al  FormSingup
                    FormLogin(),

                  //todo: button
                  Container(
                    alignment: const Alignment(0.7, 2),
                    child: FilledButton(onPressed: () {
                      
                    }, child: const Text('Entra')),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Text('¿Ya tienes una cuenta?',style: Theme.of(context).textTheme.bodySmall,),

                  //todo: button
                  FilledButton(
                    onPressed: () {
                      context.go('/');
                    },
                   child: const Text('Inicia sesión')),

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

