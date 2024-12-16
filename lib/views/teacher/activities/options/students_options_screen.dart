import 'package:aprende_mas/views/widgets/activities_body/custom_divider.dart';
import 'package:aprende_mas/views/widgets/activities_body/students/enrolled_students.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StudentsOptionsScreen extends StatelessWidget {
  const StudentsOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EnrolledStudents(),
          CustomDivider(),
          StudentsBody(),
          StudentsBody(),
          StudentsBody(),
          StudentsBody(),
          StudentsBody(),
          StudentsBody(),
          StudentsBody(),
          StudentsBody(),
          StudentsBody(),
        ],
      ),
    );
  }
}