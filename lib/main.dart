import 'package:aprende_mas/config/router/router.dart';
import 'package:flutter/material.dart';

import 'package:aprende_mas/config/utils/app_theme.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().theme(),
    );
  }
}
