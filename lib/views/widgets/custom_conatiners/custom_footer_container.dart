import 'package:flutter/material.dart';

class CustomFooterContainer extends StatelessWidget {
  const CustomFooterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.assignment)),
          const SizedBox(
            width: 60,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.people_alt)),
          const SizedBox(
            width: 60,
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.star_border_rounded)),
        ],
      ),
    );
  }
}