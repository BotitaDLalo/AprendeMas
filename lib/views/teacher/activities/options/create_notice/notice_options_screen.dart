import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeOptionsScreen extends ConsumerStatefulWidget {
  const NoticeOptionsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeOptionsScreenState();
}

class _NoticeOptionsScreenState extends ConsumerState<NoticeOptionsScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NoticeCreated(),
            SizedBox(height: 20,),
            NoticeBody()
          ],
        ),
      ),
    );
  }
}