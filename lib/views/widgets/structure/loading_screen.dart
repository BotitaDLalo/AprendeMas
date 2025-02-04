import 'package:flutter/material.dart';

Future<void> showLoadingScreen(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    },
  );
}
