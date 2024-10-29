import 'package:flutter/material.dart';

class DataBody extends StatelessWidget {
  const DataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.assignment_outlined, size: 30,),
          SizedBox(width: 10,),
          _NoticeData(),
          SizedBox(width: 70,),
        ],
      ),
    );
  }
}


class _NoticeData extends StatelessWidget {
  const _NoticeData();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nombre del docente',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12
          ),
        ),
        Text(
          '18/10/2024 23:59',
          style: TextStyle(fontSize: 8),
        )
      ],
    );
  }
}