import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.go('/activities');
      },
      icon: Icon(Icons.close, color: Colors.white, size: 40,),
    );
  }
}