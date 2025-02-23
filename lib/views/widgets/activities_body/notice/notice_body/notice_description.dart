import 'package:flutter/material.dart';

class NoticeDescription extends StatelessWidget {
  final String title;
  final String content;
  const NoticeDescription(
      {super.key, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                content,
                style: const TextStyle(fontSize: 18),
              ),
            )
          ],
        ));
  }
}
