import 'package:aprende_mas/views/widgets/forms/form_login.dart';
import 'package:flutter/material.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 150),
                const SizedBox(
                  height: 40,
                ),
                const FormLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
