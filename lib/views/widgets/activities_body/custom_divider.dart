import 'package:flutter/material.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}