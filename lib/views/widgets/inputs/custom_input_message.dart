import 'package:flutter/material.dart';

class CustomInputMessage extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onPressed;
  
  const CustomInputMessage({
    super.key, 
    required this.controller, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(bottom: 32.0, top: 16.0, left: 16.0, right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3)
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Envia una pregunta',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      // onSubmitted: (_) => onPressed(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          );
  }
}