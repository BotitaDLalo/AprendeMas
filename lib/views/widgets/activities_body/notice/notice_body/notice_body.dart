import 'package:aprende_mas/views/widgets/activities_body/custom_container_style.dart';
import 'package:flutter/material.dart';
import 'data_body.dart';
import 'notice_description.dart';
import 'package:aprende_mas/config/utils/packages.dart';

class NoticeBody extends StatelessWidget {
  final int noticeId;
  final String teacherName;
  final String createdDate;
  final String title;
  final String content;
  final bool optionsIsVisible;
  const NoticeBody(
      {super.key,
      required this.optionsIsVisible,
      required this.noticeId,
      required this.teacherName,
      required this.createdDate,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CustomContainerStyle(
        height: 280,
        width: double.infinity,
        color: Colors.white,
        // borderColor: Colors.blue,
        child: Column(
          children: [
            DataBody(
              noticeId: noticeId,
              createdDate: createdDate,
              teacherName: teacherName,
              optionsIsVisible: optionsIsVisible,
            ),
            NoticeDescription(
              title: title,
              content: content,
            ),
          ],
        ),
      ),
    );
  }
}
