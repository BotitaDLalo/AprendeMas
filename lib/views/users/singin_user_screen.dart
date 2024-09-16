import 'package:aprende_mas/views/widgets/forms/form_singin.dart';
import 'package:flutter/material.dart';

class SinginUserScreen extends StatelessWidget {
  const SinginUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FormSingin(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}