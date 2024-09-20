import 'package:aprende_mas/views/widgets/forms/form_login.dart';
import 'package:flutter/material.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 150,
                ),
                const SizedBox(
                  height: 100,
                ),
                FormLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
