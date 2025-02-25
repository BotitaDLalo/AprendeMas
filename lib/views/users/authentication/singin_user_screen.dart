import 'package:aprende_mas/config/router/router.dart';
import 'package:aprende_mas/views/users/authentication/form_singin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SinginUserScreen extends StatelessWidget {
  const SinginUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Image.asset('assets/logo.png', width: 150),
                const SizedBox(
                  height: 30,
                ),
                const FormSingin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
