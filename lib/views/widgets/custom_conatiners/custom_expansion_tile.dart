import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final Duration animationDuration;

  const CustomExpansionTile(
      {super.key,
      required this.title,
      required this.children,
      this.animationDuration = const Duration(milliseconds: 600)});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador de animación
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    // Configura la animación con Curves.easeInOut para suavizar la animación
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;

      if (_isExpanded) {
        _controller.forward(); // Expande
      } else {
        _controller.reverse(); // Contrae
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(widget.title),
          onTap: _toggleExpand, // Expande/contrae con un solo toque
        ),
        // Usa AnimatedSize para suavizar la transición de tamaño
        AnimatedSize(
          duration: widget.animationDuration,
          //Curves.ease
          //Curves.easeOutCubic
          curve: Curves.decelerate,
          child: _isExpanded
              ? Column(
                  children: widget.children,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
