import 'package:flutter/material.dart';

class Teacher extends StatelessWidget {
  const Teacher({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Screen User Teacher')],
      ),
    );
  }
}
