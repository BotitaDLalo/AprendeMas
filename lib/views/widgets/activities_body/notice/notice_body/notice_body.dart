import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/activities_body/custom_container_style.dart';
import 'package:flutter/material.dart';
import '../../custom_divider.dart';
import 'container_input.dart';
import 'data_body.dart';
import 'notice_description.dart';

class NoticeBody extends StatelessWidget {
  const NoticeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CustomContainerStyle(
        height: 280,
        width: double.infinity,
        color: Colors.white,
        borderColor: Colors.blue,
        child: Column(
          children: const [
            DataBody(),
            NoticeDescription(),
            CustomDivider(),
            ContainerInput(),
          ],
        ),
      ),
    );
  }
}
