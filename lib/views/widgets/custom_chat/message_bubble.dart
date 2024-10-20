import 'package:flutter/material.dart';
import '../../../models/message/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: message.isUser ? Colors.grey.shade300 : Colors.blue,
            borderRadius: message.isUser
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))
              : const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
          ),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isUser ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

