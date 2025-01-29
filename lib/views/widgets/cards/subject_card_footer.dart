import 'package:aprende_mas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomFooterContainer extends StatelessWidget {
  final int subjectId;
  final String subjectName;
  final String description;
  const CustomFooterContainer(
      {super.key,
      required this.subjectId,
      required this.subjectName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                final data = Subject(
                    materiaId: subjectId,
                    nombreMateria: subjectName,
                    descripcion: description);

                context.push('/activities', extra: data);
              },
              icon: const Icon(Icons.assignment)),
          // const SizedBox(
          //   width: 60,
          // ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.people_alt)),
          // const SizedBox(
          //   width: 60,
          // ),
          // IconButton(
          //     onPressed: () {}, icon: const Icon(Icons.star_border_rounded)),
        ],
      ),
    );
  }
}
