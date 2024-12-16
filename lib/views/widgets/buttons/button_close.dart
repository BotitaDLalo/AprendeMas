import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.go('/teacher-home');
      },
      icon: const Icon(Icons.close, color: Color.fromARGB(255, 0, 0, 0), size: 40,),
    );
  }
}