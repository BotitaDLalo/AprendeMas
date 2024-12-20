import 'package:flutter/material.dart';

class CustomContainerStyle extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;
  final Color? borderColor;

  const CustomContainerStyle({
    super.key, 
    required this.height, 
    required this.width, 
    required this.color, 
    required this.child, 
    this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor ?? Colors.transparent
          )
        ),
        child: child,
      ),
    );
  }
}