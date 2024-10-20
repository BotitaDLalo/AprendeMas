
import 'package:aprende_mas/views/widgets/custom_conatiners/main_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class SubjectScreen extends StatelessWidget {
//   const SubjectScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return const Scaffold(
//     //   body: MainContainer(),
//     // );
//     return Scaffold(
//       body: const MainContainer(),
//     );
//   }
// }
 
//   }
// }



String createGroup = "Grupo";
String createSubject = "Materia";

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Botón colocado encima del builder
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Mis Cursos',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if(value=='createGroup'){
                        context.push('/create-group');
                      }
                      else if(value=='createSubject'){
                        context.push('/create-subject');
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'createGroup',
                        child: Text('Crear Grupo'),
                      ),
                      const PopupMenuItem(
                        value: 'createSubject',
                        child: Text('Crear Materia'),
                      ),
                    ],
                  ),

                  // ButtonForm(
                  //   buttonName: 'Crear',
                  //   onPressed: () {
                  //     // print("SE OPRIMIO");
                  //     // context.push('/create-group');
                  //   },
                  // ),
                ],
              )),
          // Contenedor que contiene el builder
          const Expanded(
            child: MainContainer(),
          ),
        ],
      ),
    );
  }
}
