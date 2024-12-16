import 'package:aprende_mas/views/widgets/activities_body/custom_container_style.dart';
import 'package:aprende_mas/views/widgets/activities_body/notice/notice_created/input_null.dart';
import 'package:flutter/material.dart';

class NoticeCreated extends StatelessWidget {
  const NoticeCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerStyle(
      borderColor: Colors.blue,
      height: 80, 
      width: double.infinity, 
      color: Colors.white, 
      child: Row(
        children: [
          SizedBox(width: 10,),
          Icon(Icons.person),
          InputNull(),
          IconButton(onPressed: () {}, icon: Icon(Icons.assignment))

        ],
      ),
    );
  }
}
