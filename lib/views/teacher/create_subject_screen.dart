import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/widgets/forms/form_create_subject.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateSubjectsScreen extends ConsumerWidget {
  const CreateSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
        body: const Center(
          child: SingleChildScrollView(
              physics: ClampingScrollPhysics(), child: FormCreateSubject()),
        ),
      ),
    );
  }
}
