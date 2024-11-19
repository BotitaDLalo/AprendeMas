import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/form_create_subject.dart';
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
          // backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: AppTheme.degradedBlue),
          ),
          leading: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.pop();
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        ),
        body: const Center(
          child: SingleChildScrollView(
              physics: ClampingScrollPhysics(), child: FormCreateSubject()),
        ),
      ),
    );
  }
}
